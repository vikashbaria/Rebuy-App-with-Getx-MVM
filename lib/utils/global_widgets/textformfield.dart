import 'package:flutter/material.dart';
import 'package:rebay/utils/colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isPassword;
  final TextInputType keyboardType;
  final Function(String)? onChanged;
  final TextStyle? hintStyle;
  final Widget? suffixIcon;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.hintStyle,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      keyboardType: keyboardType,
      onChanged: onChanged,
      decoration: InputDecoration(
        fillColor: AppColors.textfieldbackground,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 26, vertical: 14),
        suffixIcon: suffixIcon,

        hintText: hintText,
        hintStyle:
            hintStyle ??
            const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: Color(0xFF6F6F6F),
            ),
      ),
    );
  }
}
