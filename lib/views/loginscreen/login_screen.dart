import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rebay/controllers/login/login_controller.dart';
import 'package:rebay/utils/colors.dart';
import 'package:rebay/utils/global_widgets/global_header.dart';
import 'package:rebay/utils/global_widgets/login_signtext.dart';
import 'package:rebay/utils/global_widgets/loginandsignbutton.dart';
import 'package:rebay/utils/global_widgets/social_icons.dart';
import 'package:rebay/utils/global_widgets/textformfield.dart';

class LoginScreen extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 22, right: 22),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GlobalHeader(
              title: "ReBuy",
              useSpaceBetween: true,
              onBackTap: () {
                controller.handleBack(status: 1);
              },
            ),

            SizedBox(height: 40),
            headingone(text: "Log in"),

            SizedBox(height: 30),
            Text(
              "Login with one of the following options",
              style: TextStyle(
                fontFamily: 'Arial',
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.fontcolor,
              ),
            ),
            SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  iconswidget(Imagepath: "assets/social_icons/Google.png"),
                  iconswidget(Imagepath: "assets/social_icons/Twitter.png"),
                  iconswidget(Imagepath: "assets/social_icons/Apple.png"),
                ],
              ),
            ),

            SizedBox(height: 30),
            Row(
              children: [
                Expanded(
                  child: Divider(color: Color(0xFF6F6F6F), thickness: 1),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    "OR",
                    style: TextStyle(
                      color: Color(0xFF6F6F6F),
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    ),
                  ),
                ),
                Expanded(child: Divider(color: Colors.grey, thickness: 1)),
              ],
            ),
            SizedBox(height: 30),
            CustomTextField(
              controller: controller.emailController,
              hintText: "Email",
            ),
            SizedBox(height: 20),
            CustomTextField(
              controller: controller.passwordController,
              hintText: "Password",
              isPassword: true,
            ),
            SizedBox(height: 20),

            globalGradientButton(
              label: "Log in",
              onTap: () {
                controller.logins();
              },
            ),

            SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don’t have an account?",
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: "Arial",
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    Get.offAllNamed('/signup');
                  },
                  child: Text(
                    "Sign up",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: "Arial",
                      fontWeight: FontWeight.w400,
                      color: Color(0xFFFF5A5F),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
