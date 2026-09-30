import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthServices {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  Future<void> _saveFcmToken(User? user, {String? name}) async {
    if (user == null) return;

    try {
      final token = await FirebaseMessaging.instance
          .getToken()
          .timeout(const Duration(seconds: 8));
      if (token == null) return;

      _firestore.collection('users').doc(user.uid).set({
        if (name != null) 'name': name,
        'email': user.email,
        'fcmTokens': FieldValue.arrayUnion([token]),
        'updatedAt': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true)).catchError((e) {
        log('FCM token save failed: $e');
      });
    } catch (e) {
      log('FCM token save failed: $e');
    }
  }

  Future<UserCredential?> createAccount({
    required String email,
    required String name,
    required String password,
  }) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await credential.user?.updateDisplayName(name);
      await credential.user?.reload();
      await credential.user?.sendEmailVerification();

      await _saveFcmToken(credential.user, name: name);

      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        throw 'The account already exists for that email.';
      }
      throw e.message ?? 'Something went wrong.';
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<UserCredential?> login({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      await _saveFcmToken(credential.user);
      return credential;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<UserCredential?> signInWithGoogle() async {
    try {
      final googleUser = await GoogleSignIn.instance.authenticate();

      final googleAuth = googleUser.authentication;
      final credential =
      GoogleAuthProvider.credential(idToken: googleAuth.idToken);

      final userCredential = await _auth.signInWithCredential(credential);
      await _saveFcmToken(userCredential.user);
      return userCredential;
    } catch (e) {
      log('signInWithGoogle error: $e');
      rethrow;
    }
  }

  Future<void> sendPasswordResetEmail({required String email}) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

}