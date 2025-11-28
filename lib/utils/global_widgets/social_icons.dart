import 'package:flutter/material.dart';
import 'package:rebay/utils/colors.dart';

Widget iconswidget({required String Imagepath}) {
  return Container(
    height: 60,
    width: 106,
    decoration: BoxDecoration(
      color: AppColors.textfieldbackground,
      borderRadius: BorderRadius.circular(24),
    ),
    child: Center(child: Image.asset(Imagepath, height: 26, width: 26)),
  );
}
