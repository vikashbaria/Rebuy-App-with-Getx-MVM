import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rebay/controllers/auth_controller/auth_controller.dart';
import 'package:rebay/controllers/bottom_navigation/bottom_nav_controller.dart';
import 'package:rebay/controllers/home_controller/home_controller.dart';
import 'package:rebay/utils/global_widgets/global_header.dart';
import 'package:rebay/utils/global_widgets/sidebar_widgets.dart';
import 'package:rebay/views/myaccount/myaccount_screen.dart';

class SidebarPage extends StatelessWidget {
  SidebarPage({super.key});
  final AuthController controller = Get.put(AuthController());
  final HomeController controllers = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Scrollable content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(top: 50, left: 22, right: 22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GlobalHeader(
                    title: "ReBuy",
                    useSpaceBetween: true,
                    rightWidgets: [
                      IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const BackButtonIcon(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  Sidebarmenupage(
                    icon: Icons.person_3_outlined,
                    title: "My Account",
                    subtitle: "Edit your details, account settings",
                    onTap: () {
                      Get.to(MyAccountPage());
                    },
                  ),
                  const SizedBox(height: 20),
                  Sidebarmenupage(
                    icon: Icons.card_travel,
                    title: "My Orders",
                    subtitle: "View all your orders",
                    onTap: () {
                      print("This is My Orders");
                    },
                  ),
                  const SizedBox(height: 20),
                  Sidebarmenupage(
                    icon: Icons.list,
                    title: "My Listings",
                    subtitle: "View all your orders",
                    onTap: () {
                      Get.find<BottomNavController>().changeIndex(2);
                    },
                  ),
                  const SizedBox(height: 20),
                  Sidebarmenupage(
                    icon: Icons.favorite_border,
                    title: "Liked Items",
                    subtitle: "See the products you have wishlisted",
                    onTap: () {
                      Get.find<BottomNavController>().changeIndex(2);
                    },
                  ),

                  const SizedBox(height: 20),
                  Sidebarmenupage(
                    icon: Icons.add_box_outlined,
                    title: "Add Product",
                    subtitle: "Add your products from here",
                    onTap: () {
                      controllers.addproduct();
                    },
                  ),
                  const SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(
                                color: Colors.black87,
                                width: 1,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              backgroundColor: Colors.transparent,
                            ),
                            child: const Text(
                              "Feedback",
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () => controller.logout(),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromRGBO(
                                60,
                                60,
                                60,
                                1,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 12),
                            ),
                            child: const Text(
                              "Sign out",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),

          // Bottom footer
          SizedBox(
            height: 100,
            width: double.infinity,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    "assets/images/Waves.png",
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 12,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Text(
                      "ReBuy Inc. Version 1.0",
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(245, 245, 245, 1),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
