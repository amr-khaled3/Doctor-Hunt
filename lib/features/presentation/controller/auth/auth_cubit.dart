import 'package:doctor_hunt/core/dialogs/app_dialogs.dart';
import 'package:doctor_hunt/core/router/app_route_name.dart';
import 'package:doctor_hunt/features/auth/data/repo/auth_repo.dart';
import 'package:doctor_hunt/features/presentation/controller/auth/auth_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../auth/data/service/auth_services.dart';

class AuthCubit extends Cubit<AuthState>{
  AuthCubit() : super(InitState());

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController emailForgetPasswordController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  final forgetPasswordFormKey = GlobalKey<FormState>();

  bool isVisible = false;
  bool isAgree = false;
  bool isLoading = false;


  void onChangeVisibility(){
    isVisible = !isVisible;
    emit(ChangeVisibilityState());
  }

  void onChangeAgree(){
    isAgree = !isAgree;
    emit(ChangeAgreeState());
  }

  Future<void> createAccount(BuildContext context) async {
    if (!formKey.currentState!.validate()) return;

    isLoading = true;
    emit(RegisterLoadingState());

    final data = await AuthRepo().signUp(
      email: emailController.text.trim(),
      name: nameController.text.trim(),
      password: passwordController.text,
    );

    isLoading = false;
    if (isClosed || !context.mounted) return;

    if (data['success'] == true) {
      emit(RegisterSuccessState());
      Navigator.pushReplacementNamed(context, RouteName.login);
    } else {
      AppDialogs.showMessage(data['message'], context, type: DialogType.error);
      emit(RegisterFailureState());
    }
  }

  Future<void> login(BuildContext context) async {
    if (!formKey.currentState!.validate()) return;

    isLoading = true;
    emit(LoginLoadingState());

    final data = await AuthRepo().login(
      email: emailController.text.trim(),
      password: passwordController.text,
    );

    isLoading = false;
    if (isClosed || !context.mounted) return;

    if (data['success'] == true) {
      AppDialogs.showMessage(data['message'], context);
      emit(LoginSuccessState());
    } else {
      AppDialogs.showMessage(data['message'], context, type: DialogType.error);
      emit(LoginFailureState());
    }
  }

  Future<void> signInWithGoogle(BuildContext context) async {
    isLoading = true;
    emit(RegisterLoadingState());

    final data = await AuthRepo().signInWithGoogle();

    isLoading = false;
    if (isClosed || !context.mounted) return;

    if (data['success'] == true) {
      emit(RegisterSuccessState());
    } else {
      AppDialogs.showMessage(data['message'], context, type: DialogType.error);
      emit(RegisterFailureState());
    }
  }
  Future<void> sendPasswordResetEmail(BuildContext context) async {
    if (!forgetPasswordFormKey.currentState!.validate()) return;

    isLoading = true;
    emit(ForgotPasswordLoadingState());

    var data = await AuthRepo().sendPasswordResetEmail(
      email: emailForgetPasswordController.text.trim(),
    );

    isLoading = false;

    if (!context.mounted) return;

    if (data['success'] == true) {
      AppDialogs.showMessage(data['message'], context);
      emit(ForgotPasswordSuccessState());
    } else {
      AppDialogs.showMessage(data['message'], context, type: DialogType.error);
      emit(ForgotPasswordFailureState());
    }
  }


  @override

  Future<void> close() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    emailForgetPasswordController.dispose();

    return super.close();
  }


}