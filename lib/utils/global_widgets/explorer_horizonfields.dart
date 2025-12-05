import 'package:flutter/material.dart';
import 'package:rebay/utils/colors.dart';

Widget horizontelfield({required String name, required VoidCallback onTap}) {
  return SizedBox(
    height: 46,
    width: 110,
    child: ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.fontcolor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
      ),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          name,
          style: const TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
    ),
  );
}
