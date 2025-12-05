import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rebay/controllers/myaccount_controller/myacccount_controller.dart';
import 'package:rebay/utils/colors.dart';
import 'package:rebay/utils/font.dart';
import 'package:rebay/utils/resuabletext.dart';

// ignore: must_be_immutable
class MyAccountPage extends StatelessWidget {
  MyAccountPage({super.key});
  Myaccountcontroller accountcontroller = Get.put(Myaccountcontroller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 22, right: 22),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Stack(
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundImage: AssetImage(
                              "assets/images/pic.jpeg",
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Welcome Back!",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w400,
                              color: AppColors.textColor,
                              fontFamily: AppFonts.secondaryFont,
                            ),
                          ),
                          Text(
                            "Email",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: .w300,
                              color: AppColors.fontcolor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  IconButton(
                    icon: Image.asset(
                      "assets/images/Close.png",
                      height: 30,
                      width: 30,
                    ),

                    onPressed: () => Get.back(),
                  ),
                ],
              ),
              SizedBox(height: 40),
              Text(
                "My account",
                style: TextStyle(
                  fontFamily: AppFonts.secondaryFont,
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 6, right: 6),
                child: Column(
                  children: [
                    ReusableTextInput(
                      label: "Name",
                      hint: "Vikash",
                      controller: accountcontroller.nameCtrl,
                      isTextArea: false,
                      onEditTap: () {
                        print("Edit Name Clicked");
                      },
                    ),

                    const SizedBox(height: 20),

                    ReusableTextInput(
                      label: "Email",
                      hint: "vikashbaria4@gmail.com",
                      controller: accountcontroller.emailCtrl,
                      isTextArea: false,
                      onEditTap: () {
                        print("Edit Name Clicked");
                      },
                    ),
                    const SizedBox(height: 20),
                    ReusableTextInput(
                      label: "Phone",
                      hint: "+1 561-230-0033",
                      controller: accountcontroller.emailCtrl,
                      isTextArea: false,
                      onEditTap: () {
                        print("Edit Name Clicked");
                      },
                    ),
                    const SizedBox(height: 20),
                    ReusableTextInput(
                      label: "Phone",
                      hint:
                          "Alice Eve\n2074, Half and Half Drive\nHialeah, Florida - 33012\nP  h: +1 561-230-0033",
                      controller: accountcontroller.emailCtrl,
                      isTextArea: true,
                      onEditTap: () {
                        print("Edit Name Clicked");
                      },
                    ),

                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.settings, color: Colors.black), // Icon
                          const SizedBox(width: 8),
                          Text(
                            "Settings",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
