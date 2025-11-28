import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rebay/utils/colors.dart';
import 'package:rebay/utils/font.dart';
import 'package:rebay/controllers/home_controller/home_controller.dart';
import 'package:rebay/controllers/bottom_navigation/bottom_nav_controller.dart';
import '../../views/explore/explore_screen.dart';
import '../../views/mylistings/mylistings_screen.dart';
import '../../views/likeditems/likeditems_screen.dart';
import '../../views/message/message_screen.dart';

class HomeScreen extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());
  final BottomNavController bottomController = Get.put(BottomNavController());

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(() {
          if (bottomController.selectedIndex.value == 0) {
            // Home Screen Content
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 22,
                    vertical: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Stack(
                            children: [
                              CircleAvatar(
                                radius: 40,
                                backgroundImage: AssetImage(
                                  "assets/images/pic.jpeg",
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  height: 28,
                                  width: 28,
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(218, 218, 218, 1),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.menu,
                                    size: 20,
                                    color: Color.fromRGBO(138, 138, 138, 1),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Obx(() {
                                final name = controller.userName.value;
                                return Text(
                                  name.isEmpty
                                      ? "Hey, ..."
                                      : "Hey ${capitalizeFirstLetter(name)}",
                                  style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.fontcolor,
                                  ),
                                );
                              }),
                              Text(
                                "Welcome Back!",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.textColor,
                                  fontFamily: AppFonts.secondaryFont,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      IconButton(
                        icon: Icon(Icons.menu, size: 30),
                        onPressed: () => print("Hamburger tapped"),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                // Add more home content here
                Expanded(
                  child: Center(
                    child: Text(
                      "Home Screen Content",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            );
          } else {
            // Other screens
            // Since Home is index 0, other screens are index - 1
            return bottomController
                .screens[bottomController.selectedIndex.value - 1];
          }
        }),
      ),

      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: bottomController.selectedIndex.value,
          onTap: bottomController.changeIndex,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
              icon: Icon(Icons.explore),
              label: "Explore",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: "My Listings",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Liked"),
            BottomNavigationBarItem(
              icon: Icon(Icons.message),
              label: "Messages",
            ),
          ],
        ),
      ),
    );
  }
}
