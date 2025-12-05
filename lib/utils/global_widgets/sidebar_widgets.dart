import 'package:flutter/material.dart';
import 'package:rebay/utils/colors.dart';

Widget Sidebarmenupage({
  required IconData icon,
  required String title,
  required String subtitle,
  required VoidCallback onTap,
}) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(18),
    decoration: BoxDecoration(
      color: AppColors.backgroundcolorofsidebar,
      borderRadius: BorderRadius.circular(16),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 34),

        const SizedBox(width: 18),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: onTap,
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: AppColors.fontcolor,
                  ),
                ),
              ),

              SizedBox(height: 2),

              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.fontcolor,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
