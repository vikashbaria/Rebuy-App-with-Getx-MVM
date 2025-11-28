import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rebay/controllers/auth_controller/auth_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignupController extends GetxController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var isPasswordVisible = false.obs;

  void signup() async {
    String name = nameController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      Get.snackbar(
        "Error",
        "Please fill all fields",
        backgroundColor: Colors.red,
        icon: Icon(Icons.error, color: Colors.white),
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
      );
      return;
    }

    try {
      UserCredential userCredential = await AuthController.instance.signup(
        email,
        password,
      );

      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .set({'name': name, 'email': email, 'createdAt': Timestamp.now()});

      Get.snackbar(
        "Success",
        "Account created successfully",
        backgroundColor: Colors.green,
        icon: Icon(Icons.check, color: Colors.white),
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
      );

      Get.offAllNamed('/home');
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        backgroundColor: Colors.red,
        icon: Icon(Icons.error, color: Colors.white),
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
      );
    }
  }
}
