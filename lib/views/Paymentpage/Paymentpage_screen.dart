import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rebay/models/product_model.dart';
import 'package:rebay/utils/colors.dart';
import 'package:rebay/utils/font.dart';
import 'package:rebay/utils/global_widgets/cards_widgets.dart';
import 'package:rebay/utils/global_widgets/global_header.dart';
import 'package:rebay/utils/global_widgets/purchasebottombutton.dart';
import 'package:rebay/views/orderconfirmation/onrder_screen.dart';

class Paymentpage extends StatelessWidget {
  final ProductModel product;
  Paymentpage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 70, left: 22, right: 22),
        child: SingleChildScrollView(
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
                  'assets/purchasebar/Progress_bar1.png',
                  width: 218,
                  height: 30,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 40),

              Container(
                width: double.infinity,
                height: 240,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      Text(
                        product.name,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          fontFamily: AppFonts.secondaryFont,
                          color: Color(0xFF3C3C3C),
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
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
                        ],
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Payment Details",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          fontFamily: AppFonts.secondaryFont,
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Total Amount: "),
                                Text(
                                  "${product.price}",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: AppFonts.secondaryFont,
                                    color: AppColors.fontcolor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Shipping Fee: "),
                                Text(
                                  "\$15",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: AppFonts.secondaryFont,
                                    color: AppColors.fontcolor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Total: "),
                                Text(
                                  "\$${(product.price + 15).toStringAsFixed(0)}",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: AppFonts.secondaryFont,
                                    color: AppColors.fontcolor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Selected Card",
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: AppFonts.secondaryFont,
                  fontWeight: FontWeight.w700,
                ),
              ),

              SizedBox(height: 30),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [carddetails(), SizedBox(width: 20), carddetails()],
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    "Enter CVV:",
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 24,
                      fontFamily: AppFonts.secondaryFont,
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    width: 70,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Color(0xFFDEDEDE),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hint: Text(
                          "CVV",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 24,
                            fontFamily: AppFonts.secondaryFont,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: bottomButton(
        onPressed: () => Get.to(() => Ordernow(product: product)),

        buttontext: "Pay now",
      ),
    );
  }
}
