import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:rebay/controllers/bottom_navigation/bottom_nav_controller.dart';
import 'package:rebay/utils/global_widgets/Likesitems.dart';
import 'package:rebay/utils/global_widgets/global_header.dart';
import 'package:rebay/views/sidebar/sidebar_screen.dart';
import 'package:get/get.dart';

class LikedItemsScreen extends StatelessWidget {
  const LikedItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.only(top: 20, left: 22, right: 22),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GlobalHeader(
                title: "Liked Items",
                onBackTap: () {
                  Get.find<BottomNavController>().changeIndex(0);
                },
                rightWidgets: [
                  IconButton(
                    onPressed: () {
                      Get.to(SidebarPage());
                    },
                    icon: const Icon(Icons.menu, size: 30),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              Likesitems(
                imagePath: "assets/images/productimage/1.jpg",
                productName: "Apple MacBook Pro 16\"",
                date: "15 March 2025",
                price: "\$2,499",
              ),
              SizedBox(height: 20),

              Likesitems(
                imagePath: "assets/images/productimage/2.jpg",
                productName: "Samsung Galaxy S23 Ultra",
                date: "15 March 2025",
                price: "\$2,499",
              ),
              SizedBox(height: 20),

              Likesitems(
                imagePath: "assets/images/productimage/3.jpg",
                productName: "Sony WH-1000XM5 Headphones",
                price: "\$2,499",
                date: "10 Feb 2025",
              ),
              SizedBox(height: 20),

              Likesitems(
                imagePath: "assets/images/productimage/4.jpg",
                productName: "Apple iPad Air 5th Gen",
                price: "\$2,499",
                date: "05 Jan 2025",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
