import 'package:flutter/material.dart';
import 'package:rebay/utils/colors.dart';
import 'package:rebay/utils/font.dart';

Widget arrivalandrecent({required String firstext}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        firstext,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: AppColors.fontcolor,
          fontFamily: AppFonts.secondaryFont,
        ),
      ),
      Text(
        "View More",
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: Color.fromRGBO(137, 137, 137, 1),
          fontFamily: AppFonts.secondaryFont,
        ),
      ),
    ],
  );
}
