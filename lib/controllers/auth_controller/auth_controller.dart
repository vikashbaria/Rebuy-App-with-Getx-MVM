import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rebay/views/homescreen/home_screen.dart';
import 'package:rebay/views/loginscreen/login_screen.dart';

class AuthController extends GetxController {
  static AuthController get instance => Get.find();

  final FirebaseAuth auth = FirebaseAuth.instance;
  Rx<User?> firebaseUser = Rx<User?>(null);

  @override
  void onInit() {
    super.onInit();
    firebaseUser.bindStream(auth.authStateChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  void _setInitialScreen(User? user) {
    if (user == null) {
      Get.offAllNamed('/login');
    } else {
      Get.offAllNamed('/home');
    }
  }

  // LOGIN
  Future<void> login(String email, String password) async {
    try {
      // ignore: unused_local_variable
      final credential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      Get.snackbar(
        "Success",
        "Logged in successfully",
        duration: Duration(seconds: 3),
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        backgroundColor: Colors.green,
      );

      await Future.delayed(Duration(seconds: 3));
      Get.off(HomeScreen());
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        "Error",
        e.message ?? "Login failed",
        backgroundColor: Colors.red,
        icon: Icon(Icons.error, color: Colors.white),
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
      );
    }
  }

  // SIGNUP
  Future<UserCredential> signup(String email, String password) async {
    try {
      final credential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      Get.snackbar(
        "Success",
        "Account has been created",
        duration: Duration(seconds: 6),
        snackPosition: SnackPosition.BOTTOM,
        icon: Icon(Icons.check_circle, color: Colors.white),
        colorText: Colors.white,
        backgroundColor: Colors.green,
      );

      await Future.delayed(Duration(seconds: 3));
      Get.off(LoginScreen());

      return credential;
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        "Error",
        e.message ?? "Signup failed",
        backgroundColor: Colors.red,
        icon: Icon(Icons.error, color: Colors.white),
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
      );

      rethrow;
    }
  }

  Future<void> logout() async {
    await auth.signOut();
  }
}
