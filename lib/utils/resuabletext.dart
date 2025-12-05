import 'package:flutter/material.dart';
import 'package:rebay/utils/font.dart';

class ReusableTextInput extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final bool isTextArea;
  final VoidCallback? onEditTap;

  const ReusableTextInput({
    super.key,
    required this.label,
    required this.hint,
    required this.controller,
    this.isTextArea = false,
    this.onEditTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Color(0xFF3C3C3C),
                fontFamily: AppFonts.secondaryFont,
              ),
            ),
          ],
        ),

        const SizedBox(height: 6),

        TextField(
          controller: controller,
          maxLines: isTextArea ? 5 : 1,
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xFFEAEAEA),
            suffixIcon: Image.asset("assets/social_icons/Vector.png"),

            hintText: hint,
            hintStyle: TextStyle(
              color: Color(0xFF656565),
              fontSize: 18,
              fontWeight: FontWeight.w300,
            ),

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
          ),
        ),
      ],
    );
  }
}
