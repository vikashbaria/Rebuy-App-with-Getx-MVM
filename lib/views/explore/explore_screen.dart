import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rebay/controllers/bottom_navigation/bottom_nav_controller.dart';
import 'package:rebay/controllers/home_controller/home_controller.dart';
import 'package:rebay/controllers/listing_controller/listing_screen.dart';
import 'package:rebay/utils/colors.dart';
import 'package:rebay/utils/global_widgets/explorer_horizonfields.dart';
import 'package:rebay/utils/global_widgets/global_header.dart';
import 'package:rebay/utils/global_widgets/listing_widget.dart';
import 'package:rebay/utils/global_widgets/textformfield.dart';
import 'package:rebay/views/sidebar/sidebar_screen.dart';

class ExploreScreen extends StatelessWidget {
  ExploreScreen({super.key});

  final HomeController controller = Get.put(HomeController());
  final ListingController controllerlisting = Get.put(ListingController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 22, right: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GlobalHeader(
            title: "My Explore",
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

          CustomTextField(
            controller: controller.searchbar,
            hintText: "Search for books, guitar and more...",
            hintStyle: const TextStyle(
              fontSize: 18,
              color: AppColors.fontcolor,
              fontWeight: FontWeight.w400,
            ),
            suffixIcon: const Icon(Icons.search),
          ),

          const SizedBox(height: 30),

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                horizontelfield(
                  name: "Books",
                  onTap: () {
                    print("Books clicked");
                  },
                ),
                const SizedBox(width: 10),
                horizontelfield(
                  name: "Game",
                  onTap: () {
                    print("Game clicked");
                  },
                ),
                const SizedBox(width: 10),
                horizontelfield(
                  name: "Music",
                  onTap: () {
                    print("Music clicked");
                  },
                ),
                const SizedBox(width: 10),
                horizontelfield(
                  name: "Camera",
                  onTap: () {
                    print("Camera clicked");
                  },
                ),
                const SizedBox(width: 10),
                horizontelfield(
                  name: "Technology",
                  onTap: () {
                    print("Technology clicked");
                  },
                ),
                const SizedBox(width: 10),
                horizontelfield(
                  name: "Gadgets",
                  onTap: () {
                    print("Gadgets clicked");
                  },
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          Expanded(
            child: Obx(() {
              return ListView.builder(
                itemCount: controllerlisting.listings.length,
                itemBuilder: (context, index) {
                  final listing = controllerlisting.listings[index];
                  return ListingCard(listing: listing, index: index);
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
