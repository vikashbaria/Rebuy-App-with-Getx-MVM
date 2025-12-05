import 'package:flutter/material.dart';
import 'package:rebay/models/product_model.dart';
import 'package:rebay/utils/colors.dart';
import 'package:rebay/utils/font.dart';

Widget buildProductCard(ProductModel product) {
  return Container(
    width: 264,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.3),
          blurRadius: 5,
          offset: Offset(0, 3),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
              child: Image.network(
                product.imageUrls.isNotEmpty ? product.imageUrls[0] : "",
                height: 120,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 12,
              right: 8,
              child: Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.transparent, width: 1),
                ),
                child: Icon(Icons.favorite_border, color: Colors.red, size: 20),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.name,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  fontFamily: AppFonts.secondaryFont,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "${product.brand} | ",
                        style: TextStyle(
                          fontFamily: AppFonts.secondaryFont,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      Text(
                        "${product.year}",
                        style: TextStyle(
                          fontFamily: AppFonts.secondaryFont,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "\$${product.price}",
                    style: TextStyle(
                      fontFamily: AppFonts.secondaryFont,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: AppColors.fontcolor,
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
