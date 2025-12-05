import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rebay/controllers/product_view/productview_controller.dart';
import 'package:rebay/utils/colors.dart';
import 'package:rebay/utils/font.dart';
import 'package:rebay/utils/global_widgets/global_header.dart';
import 'package:rebay/utils/global_widgets/produc_card.dart';
import 'package:rebay/views/purchaseform/purchaseform_screen.dart';

class ProductDetailsScreen extends StatelessWidget {
  final String productId;
  ProductDetailsScreen({super.key, required this.productId});

  final ViewProductController controller = Get.put(ViewProductController());

  @override
  Widget build(BuildContext context) {
    controller.fetchProduct(productId);

    return Scaffold(
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (controller.product.value == null) {
          return const Center(child: Text("Product not found"));
        }

        final product = controller.product.value!;

        return Padding(
          padding: const EdgeInsets.only(top: 70, left: 22, right: 22),
          child: SingleChildScrollView(
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
                const SizedBox(height: 20),
                Image.network(
                  product.imageUrls.isNotEmpty ? product.imageUrls.first : "",
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      product.name,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF3C3C3C),
                        fontFamily: AppFonts.secondaryFont,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFFFF5A5F),
                      ),
                      child: const Icon(
                        Icons.message_rounded,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  "\$${product.price}",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF087E8B),
                    fontFamily: AppFonts.secondaryFont,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  product.description,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF3C3C3C),
                    fontFamily: AppFonts.secondaryFont,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const Text(
                      "Within Warranty",
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(width: 4),
                    const Icon(
                      Icons.cancel_rounded,
                      color: Colors.red,
                      size: 24,
                    ),
                    const SizedBox(width: 20),
                    const Text(
                      "Original Packing",
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(width: 4),
                    Icon(
                      product.isOriginal
                          ? Icons.check_circle
                          : Icons.cancel_rounded,
                      color: product.isOriginal ? Colors.green : Colors.red,
                      size: 24,
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    side: const BorderSide(color: Color(0xFF000000)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/social_icons/Google.png',
                        height: 20,
                        width: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "Search Details",
                        style: TextStyle(
                          color: const Color(0xFF000000),
                          fontFamily: AppFonts.secondaryFont,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "Similar products",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    fontFamily: AppFonts.secondaryFont,
                  ),
                ),
                const SizedBox(height: 20),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: controller.similarProducts.map((p) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: buildProductCard(p),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 100),
              ],
            ),
          ),
        );
      }),
      bottomNavigationBar: Obx(() {
        final product = controller.product.value;
        if (product == null) return const SizedBox.shrink();

        return Container(
          color: Colors.white,
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.fontcolor,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  child: Text(
                    "Save Items",
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: AppFonts.secondaryFont,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFFECECEC),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(() => PurchaseFormScreen(product: product));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.textColor,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  child: Text(
                    "Buy Now",
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: AppFonts.secondaryFont,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFFECECEC),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
