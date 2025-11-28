import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:rebay/controllers/auth_controller/auth_controller.dart';
import 'dart:io';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RxBool isPasswordVisible = false.obs;

  void logins() {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar("Error", "Please enter email & password");
      return;
    }

    AuthController.instance.login(email, password);
  }

  void handleBack({int? status = 0}) {
    Get.defaultDialog(
      title: "Exit App",
      middleText: "Do you want to exit the application?",
      textCancel: "No",
      textConfirm: "Yes",
      onConfirm: () {
        if (status == 0) {
          Get.back();
        } else {
          exit(0);
        }
      },
      onCancel: () => Get.back(),
    );
  }
}
