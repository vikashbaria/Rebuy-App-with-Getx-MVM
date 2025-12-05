import 'package:flutter/material.dart';
import 'package:rebay/utils/colors.dart';
import 'package:rebay/utils/font.dart';

Widget bottomButton({
  required VoidCallback onPressed,
  required String buttontext,
}) {
  return SizedBox(
    width: double.infinity,
    height: 80,
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.textColor,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      ),
      child: Text(
        buttontext,
        style: TextStyle(
          fontSize: 24,
          fontFamily: AppFonts.secondaryFont,
          fontWeight: FontWeight.w500,
          color: Color(0xFFECECEC),
        ),
      ),
    ),
  );
}
