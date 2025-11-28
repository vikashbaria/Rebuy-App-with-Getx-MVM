import 'package:flutter/material.dart';
import 'package:rebay/controllers/splashcont/splash_controller.dart';
import 'package:get/get.dart';
import 'package:rebay/utils/colors.dart';
import 'package:rebay/utils/font.dart';

class Splashscreen extends StatelessWidget {
  Splashscreen({super.key});

  final SplashController splashController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(gradient: AppColors.primaryGradient),
          child: Center(
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              alignment: .center,
              child: Text(
                "ReBuy",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w800,
                  fontFamily: AppFonts.primaryFont,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
