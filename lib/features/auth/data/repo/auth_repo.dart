import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../models/user_model.dart';
import '../service/auth_services.dart';

class AuthRepo {
  final AuthServices _authService = AuthServices();

  Future<Map<String, dynamic>> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final user = await _authService.createAccount(
        email: email,
        password: password,
        name: name,
      );

      if (user != null) {
        final userModel = UserModel(
          uid: user.user!.uid,
          name: name,
          email: email,
        );
        return {'success': true, 'user': "Welcome ${userModel.name}"};
      }
      return {'success': false, 'message': 'Something wrong, please try again'};
    } on FirebaseAuthException catch (e) {
      return {'success': false, 'message': _mapError(e.code)};
    } catch (e) {
      return {'success': false, 'message': e.toString()};
    }
  }

  Future<Map<String, dynamic>> signInWithGoogle() async {
    try {
      final user = await _authService.signInWithGoogle();

      if (user != null && user.user != null) {
        final userModel = UserModel(
          uid: user.user!.uid,
          name: user.user!.displayName ?? '',
          email: user.user!.email ?? '',
        );
        return {'success': true, 'message': 'Welcome ${userModel.name}'};
      }
      return {'success': false, 'message': 'Something wrong, please try again'};
    } on GoogleSignInException catch (e) {
      log('GoogleSignInException: ${e.code}');
      if (e.code == GoogleSignInExceptionCode.canceled) {
        return {'success': false, 'message': 'Sign in was cancelled'};
      }
      return {'success': false, 'message': 'Google sign-in failed, please try again'};
    } on FirebaseAuthException catch (e) {
      log('FirebaseAuthException: ${e.code} - ${e.message}');
      return {
        'success': false,
        'message': e.message ?? 'Something wrong, please try again',
      };
    } catch (e) {
      log('Unknown error: $e');
      return {'success': false, 'message': 'Something wrong, please try again'};
    }
  }

  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    try {
      final user = await _authService.login(
        email: email,
        password: password,
      );

      if (user != null) {
        if (user.user!.emailVerified) {
          return {
            'success': true,
            'message': 'Welcome back ${user.user?.displayName ?? ''}',
          };
        } else {
          return {'success': false, 'message': 'Email not verified'};
        }
      } else {
        return {'success': false, 'message': 'Something wrong, please try again'};
      }
    } on FirebaseAuthException catch (e) {
      return {'success': false, 'message': _mapError(e.code)};
    } catch (e) {
      return {'success': false, 'message': e.toString()};
    }
  }
  Future<Map<String, dynamic>> sendPasswordResetEmail({
    required String email,
  }) async {
    try {
      await _authService.sendPasswordResetEmail(email: email);
      return {
        'success': true,
        'message': 'Reset link sent. Check your email.',
      };
    } on FirebaseAuthException catch (e) {
      return {'success': false, 'message': _mapError(e.code)};
    } catch (e) {
      return {'success': false, 'message': 'Something wrong, please try again'};
    }
  }



  String _mapError(String code) {
    switch (code) {
      case 'weak-password':
        return 'Weak Password';
      case 'email-already-in-use':
        return 'Email already in use';
      case 'invalid-email':
        return 'Invalid Email';
      case 'user-not-found':
        return 'User not found';
      case 'wrong-password':
        return 'Wrong Password';
      case 'network-request-failed':
        return 'No internet connection';
      case 'too-many-requests':
        return 'Too many attempts, try again later';
      default:
        return 'Something wrong, please try again';
    }
  }


}

