
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class CustomToast {
  static void showSuccess(String message){
    toastification.show(
        title: Text(message),
        autoCloseDuration: const Duration(seconds: 3),
        type: ToastificationType.success,
        style: ToastificationStyle.fillColored,
        alignment: Alignment.bottomCenter
    );
  }
  static void showError(String message){
    toastification.show(
        title: Text(message),
        autoCloseDuration: const Duration(seconds: 3),
        type: ToastificationType.error,
        style: ToastificationStyle.fillColored,
        alignment: Alignment.bottomCenter
    );
  }
}