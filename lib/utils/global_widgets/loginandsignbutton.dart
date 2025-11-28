import 'package:flutter/material.dart';
import '../../utils/colors.dart';

Widget globalGradientButton({
  required String label,
  required VoidCallback onTap,
  double height = 54,
  double borderRadius = 28,
  List<Color>? gradientColors,
}) {
  return SizedBox(
    width: double.infinity,
    height: height,
    child: ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      child: Ink(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradientColors ?? [Color(0xFFFF5A5F), Color(0xFFC1839F)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Container(
          alignment: Alignment.center,
          child: Text(
            label,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: AppColors.backgroundColor,
            ),
          ),
        ),
      ),
    ),
  );
}
