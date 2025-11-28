import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rebay/controllers/signup_controller/signup_controller.dart';
import 'package:rebay/utils/colors.dart';
import 'package:rebay/utils/global_widgets/global_header.dart';
import 'package:rebay/utils/global_widgets/login_signtext.dart';
import 'package:rebay/utils/global_widgets/loginandsignbutton.dart';
import 'package:rebay/utils/global_widgets/social_icons.dart';
import 'package:rebay/utils/global_widgets/textformfield.dart';
import 'package:rebay/views/loginscreen/login_screen.dart';

class Signup extends StatelessWidget {
  final SignupController controller = Get.put(SignupController());

  Signup({super.key});

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
                Get.off(LoginScreen());
              },
            ),

            SizedBox(height: 40),
            headingone(text: "Sign up"),

            SizedBox(height: 30),
            Text(
              "Sign up with one of the following options",
              style: TextStyle(
                fontFamily: 'Arial',
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.fontcolor,
              ),
            ),
            SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
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
              controller: controller.nameController,
              hintText: "Name",
            ),
            SizedBox(height: 20),

            // Email Field
            CustomTextField(
              controller: controller.emailController,
              hintText: "Email",
            ),
            SizedBox(height: 20),

            // Password Field
            Obx(
              () => CustomTextField(
                controller: controller.passwordController,
                hintText: "Password",
                isPassword: !controller.isPasswordVisible.value,
              ),
            ),
            SizedBox(height: 20),

            globalGradientButton(label: "Sign up", onTap: controller.signup),

            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: "Arial",
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    Get.offAllNamed('/login');
                  },
                  child: Text(
                    "Log in",
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
