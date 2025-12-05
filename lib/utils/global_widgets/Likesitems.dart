import 'package:flutter/material.dart';
import 'package:rebay/utils/colors.dart';

Widget Likesitems({
  required String imagePath,
  required String productName,
  required String date,
  required String price,
  bool isVisible = true,
  VoidCallback? onVisibilityTap,
}) {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
      color: AppColors.backgroundcoloritemproduct,
      borderRadius: BorderRadius.circular(12),
    ),
    padding: const EdgeInsets.all(12),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            imagePath,
            height: 80,
            width: 80,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 12),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                productName,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: Color(0xFF616161),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    date,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Color(0xFF898989),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    price,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Color(0xFF616161),
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  Container(
                    width: 40,
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: GestureDetector(
                      onTap: onVisibilityTap,
                      child: Icon(
                        isVisible ? Icons.favorite : Icons.featured_video_sharp,
                        size: 18,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
