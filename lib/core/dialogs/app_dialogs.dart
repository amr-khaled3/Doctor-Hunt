import 'package:flutter/material.dart';

class AppDialogs {
  static void showMessage(String title, BuildContext context, {DialogType type = DialogType.success}){
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(title),
          backgroundColor: type == DialogType.success ? Colors.green : Colors.red,
          duration: Duration(
            seconds: 5,
          ),
          behavior: SnackBarBehavior.floating,
        )
    );
  }
}
enum DialogType{
  success,
  error
}