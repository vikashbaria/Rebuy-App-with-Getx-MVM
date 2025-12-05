import 'package:flutter/material.dart';
import 'package:rebay/utils/colors.dart';

// ignore: non_constant_identifier_names
Widget ListingPageItem({
  required String imagePath,
  required String productName,
  required String views,
  required String price,
  required String date,
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
          child: SingleChildScrollView(
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
                const SizedBox(height: 4),

                Row(
                  children: [
                    const Icon(
                      Icons.remove_red_eye,
                      size: 14,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      views,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color(0xFF616161),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.backgroundcolorofsidebar,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min, // <-- important
                        children: const [
                          Icon(Icons.email_outlined, size: 16),
                          SizedBox(width: 4),
                          Text("3", style: TextStyle(fontSize: 12)),
                        ],
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 8),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          price,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Color(0xFF087E8B),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(width: 40),
                        Text(
                          date,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Color(0xFFC1839F),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: onVisibilityTap,
                      child: Icon(
                        isVisible ? Icons.visibility : Icons.visibility_off,
                        size: 18,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
