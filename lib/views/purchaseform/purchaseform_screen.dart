import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rebay/controllers/purchaseform_controller/purchase_controller.dart';
import 'package:rebay/models/product_model.dart';
import 'package:rebay/utils/colors.dart';
import 'package:rebay/utils/font.dart';
import 'package:rebay/utils/global_widgets/global_header.dart';
import 'package:rebay/utils/global_widgets/purchasebottombutton.dart';
import 'package:rebay/views/Paymentpage/Paymentpage_screen.dart';

class PurchaseFormScreen extends StatelessWidget {
  final ProductModel product;
  PurchaseFormScreen({super.key, required this.product});

  final PurchaseFormController controller = Get.put(PurchaseFormController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 70, left: 22, right: 22),
              child: Column(
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
                      'assets/purchasebar/Progress_bar.png',
                      width: 218,
                      height: 30,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 20),

                  Container(
                    height: 140,
                    padding: EdgeInsets.all(12),

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.accentColor.withOpacity(0.1),
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
                  SizedBox(height: 20),

                  Container(
                    width: double.infinity,
                    height: 180,
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
                            "Shipping Address",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              fontFamily: AppFonts.secondaryFont,
                            ),
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Alice Eve\n2074, Half and Half Drive\nHialeah, Florida - 33012\nPh: +1 561-230-0033",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18,
                                  color: AppColors.fontcolor,
                                ),
                              ),
                              Container(
                                height: 40,
                                width: 40,
                                margin: EdgeInsets.only(top: 60),
                                decoration: BoxDecoration(
                                  color: AppColors.backgroundcolorofsidebar,
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.edit_location_outlined,
                                    color: Colors.black,
                                    size: 24,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 14),

                  Container(
                    width: double.infinity,
                    height: 180,
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
                            "Invoice Details",
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Product Cost: ",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 18,
                                        color: AppColors.fontcolor,
                                      ),
                                    ),
                                    Text(
                                      "\$${product.price}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 18,
                                        color: AppColors.fontcolor,
                                      ),
                                    ),
                                  ],
                                ),

                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Shipping Cost: ",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 18,
                                        color: AppColors.fontcolor,
                                      ),
                                    ),
                                    Text(
                                      "\$15",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 18,
                                        color: AppColors.fontcolor,
                                      ),
                                    ),
                                  ],
                                ),

                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Total: ",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18,
                                        color: AppColors.fontcolor,
                                        fontFamily: AppFonts.secondaryFont,
                                      ),
                                    ),
                                    Text(
                                      "\$${(product.price + 15).toStringAsFixed(0)}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18,
                                        color: AppColors.fontcolor,
                                        fontFamily: AppFonts.secondaryFont,
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
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: bottomButton(
        onPressed: () => Get.to(() => Paymentpage(product: product)),

        buttontext: "Proceed to Payment",
      ),
    );
  }
}
