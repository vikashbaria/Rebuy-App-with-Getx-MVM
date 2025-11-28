import 'package:flutter/material.dart';
import 'package:rebay/utils/colors.dart';
import 'package:rebay/utils/font.dart';

Widget headingone({required String text}) {
  return Text(
    text,
    style: TextStyle(
      fontFamily: AppFonts.primaryFont,
      fontSize: 48,
      fontWeight: FontWeight.w800,
      color: AppColors.fontcolor,
    ),
  );
}
