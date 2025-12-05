import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rebay/models/product_model.dart';
import 'package:rebay/utils/colors.dart';
import 'package:rebay/utils/font.dart';
import 'package:rebay/utils/global_widgets/global_header.dart';
import 'package:rebay/utils/global_widgets/purchasebottombutton.dart';
import 'package:rebay/views/homescreen/home_screen.dart';

class Ordernow extends StatelessWidget {
  final ProductModel product;
  const Ordernow({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 70, left: 22, right: 22),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GlobalHeader(
              title: "ReBuy",
              useSpaceBetween: true,
              rightWidgets: [
                IconButton(
                  onPressed: () => Get.back(),
                  icon: const BackButtonIcon(),
                ),
              ],
            ),
            const SizedBox(height: 30),

            Center(
              child: Image.asset(
                'assets/purchasebar/p3.png',
                width: 218,
                height: 30,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 40),
            Text(
              "Order Confirmed ",
              style: TextStyle(
                fontSize: 24,
                fontFamily: AppFonts.secondaryFont,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Icon(
                      Icons.check_circle,
                      size: 80,
                      color: Colors.green,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Your payment for\n\$${15 + product.price}\nis succesfully",
                    style: TextStyle(
                      fontSize: 38,
                      fontWeight: FontWeight.w700,
                      fontFamily: AppFonts.secondaryFont,
                      color: Color(0xFF3C3C3C),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            Container(
              height: 140,
              padding: EdgeInsets.all(12),

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Color.fromRGBO(8, 139, 13, 0.25),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),

                    child: Image.network(
                      product.imageUrls.first,
                      height: 110,
                      width: 110,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            fontFamily: AppFonts.secondaryFont,
                            color: AppColors.fontcolor,
                          ),
                        ),
                        SizedBox(height: 2),

                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "Brand: ",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: AppFonts.secondaryFont,
                                  color: AppColors.fontcolor,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              TextSpan(
                                text: "${product.brand}",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: AppFonts.secondaryFont,
                                  color: AppColors.fontcolor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: " | Year: ",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: AppFonts.secondaryFont,
                                  color: AppColors.fontcolor,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              TextSpan(
                                text: "${product.year}",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: AppFonts.secondaryFont,
                                  color: AppColors.fontcolor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          "\$${product.price}",
                          style: TextStyle(
                            color: AppColors.accentColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 24,
                            fontFamily: AppFonts.secondaryFont,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: bottomButton(
        onPressed: () => Get.to(() => HomeScreen()),

        buttontext: "Go to Home",
      ),
    );
  }
}
