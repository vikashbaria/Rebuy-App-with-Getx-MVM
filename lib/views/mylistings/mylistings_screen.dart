import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rebay/controllers/bottom_navigation/bottom_nav_controller.dart';
import 'package:rebay/utils/global_widgets/global_header.dart';
import 'package:rebay/utils/global_widgets/listings_widgetforlistingpage.dart';
import 'package:rebay/views/sidebar/sidebar_screen.dart';

class MyListingsScreen extends StatelessWidget {
  const MyListingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 22, right: 22),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GlobalHeader(
                title: "My Listings",
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

              ListingPageItem(
                imagePath: "assets/images/productimage/1.jpg",
                productName: "Apple MacBook Pro 16",
                views: "1.8k Views",
                price: "\$2,499",
                date: "20 April 2025",
              ),
              SizedBox(height: 20),

              ListingPageItem(
                imagePath: "assets/images/productimage/2.jpg",
                productName: "Samsung Galaxy S23 Ultra",
                views: "2.3k Views",
                price: "\$1,199",
                date: "15 March 2025",
              ),
              SizedBox(height: 20),

              ListingPageItem(
                imagePath: "assets/images/productimage/3.jpg",
                productName: "Sony WH-1000XM5 Headphones",
                views: "950 Views",
                price: "\$399",
                date: "10 Feb 2025",
              ),
              SizedBox(height: 20),

              ListingPageItem(
                imagePath: "assets/images/productimage/4.jpg",
                productName: "Apple iPad Air 5th Gen",
                views: "1.2k Views",
                price: "\$599",
                date: "05 Jan 2025",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
