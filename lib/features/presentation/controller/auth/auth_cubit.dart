import 'package:doctor_hunt/core/dialogs/app_dialogs.dart';
import 'package:doctor_hunt/features/auth/data/repo/auth_repo.dart';
import 'package:doctor_hunt/features/presentation/controller/auth/auth_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../auth/data/service/auth_services.dart';

class AuthCubit extends Cubit<AuthState>{
  AuthCubit() : super(InitState());

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  bool isVisible = false;
  bool isAgree = false;


  void onChangeVisibility(){
    isVisible = !isVisible;
    emit(ChangeVisibilityState());
  }

  void onChangeAgree(){
    isAgree = !isAgree;
    emit(ChangeAgreeState());
  }

  Future<void> createAccount(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      var data = await AuthRepo().signUp(
        email: emailController.text,
        name: nameController.text,
        password: passwordController.text,
      );

      if (data['success'] == true) {
        emit(RegisterSuccessState());
      } else {
        AppDialogs.showMessage(data['message'], context, type: DialogType.error);
        emit(RegisterFailureState());
      }

    }
  }

  Future<void> login(BuildContext context) async {

    if (formKey.currentState!.validate()) {
      // print(nameController.text);
        var data = await AuthRepo().login(
          email: emailController.text,
          password: passwordController.text,
        );

        if (data['success'] == true) {
          AppDialogs.showMessage( data['message'], context);
          emit(LoginSuccessState());
        } else {
          AppDialogs.showMessage(data['message'], context, type: DialogType.error);
          emit(LoginFailureState());
        }
    }

  }





}