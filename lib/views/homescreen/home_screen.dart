import 'package:rebay/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:rebay/controllers/home_controller/home_controller.dart';
import 'package:rebay/controllers/product_controller/product_controller.dart';
import 'package:rebay/controllers/bottom_navigation/bottom_nav_controller.dart';
import 'package:rebay/models/product_model.dart';
import 'package:rebay/utils/global_widgets/bottom_icons.dart';
import 'package:rebay/utils/global_widgets/produc_card.dart';
import 'package:rebay/utils/global_widgets/textformfield.dart';
import 'package:rebay/utils/global_widgets/viewmores.dart';
import 'package:rebay/utils/font.dart';
import 'package:get/get.dart';
import 'package:rebay/views/sidebar/sidebar_screen.dart';
import 'package:rebay/views/viewproduct/viewproduct_screen.dart';

class HomeScreen extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());
  final BottomNavController bottomController = Get.put(BottomNavController());
  final ProductController productController = Get.put(ProductController());

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(() {
          if (bottomController.selectedIndex.value == 0) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
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
                          onPressed: () => Get.to(SidebarPage()),
                        ),
                      ],
                    ),
                  ),

                  CustomTextField(
                    controller: controller.searchbar,
                    hintText: "Search for books, guitar and more...",
                    hintStyle: TextStyle(
                      fontSize: 18,
                      color: AppColors.fontcolor,
                      fontWeight: FontWeight.w400,
                    ),
                    suffixIcon: Icon(Icons.search),
                  ),

                  SizedBox(height: 40),

                  arrivalandrecent(firstext: "New arrivals"),
                  SizedBox(height: 20),

                  StreamBuilder<List<ProductModel>>(
                    stream: productController.getProducts("new_arrival"),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }

                      if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return Text("No new arrivals found");
                      }

                      final products = snapshot.data!.take(5).toList();

                      return SizedBox(
                        height: 200,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: products.length,
                          itemBuilder: (context, index) {
                            final product = products[index];
                            return Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: GestureDetector(
                                onTap: () {
                                  Get.to(
                                    () => ProductDetailsScreen(
                                      productId: product.id,
                                    ),
                                  );
                                },
                                child: buildProductCard(product),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),

                  SizedBox(height: 30),
                  arrivalandrecent(firstext: "Recent"),
                  SizedBox(height: 20),

                  StreamBuilder<List<ProductModel>>(
                    stream: productController.getRecentProducts(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }

                      if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return Text("No recent products found");
                      }

                      final products = snapshot.data!.take(5).toList();

                      return SizedBox(
                        height: 200,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: products.length,
                          itemBuilder: (context, index) {
                            final product = products[index];
                            return Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: GestureDetector(
                                onTap: () {
                                  Get.to(
                                    () => ProductDetailsScreen(
                                      productId: product.id,
                                    ),
                                  );
                                },
                                child: buildProductCard(product),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),

                  SizedBox(height: 50),
                ],
              ),
            );
          } else {
            return bottomController
                .screens[bottomController.selectedIndex.value - 1];
          }
        }),
      ),

      bottomNavigationBar: SafeArea(
        child: Obx(() {
          return Container(
            margin: EdgeInsets.only(left: 12, right: 12),
            decoration: BoxDecoration(
              color: AppColors.fontcolor,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: SizedBox(
                child: BottomNavigationBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  currentIndex: bottomController.selectedIndex.value,
                  onTap: bottomController.changeIndex,
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.white,
                  unselectedItemColor: Colors.grey,
                  showUnselectedLabels: false,
                  items: [
                    BottomNavigationBarItem(
                      icon: buildIcon(Icons.home, 0),
                      label: "",
                    ),
                    BottomNavigationBarItem(
                      icon: buildIcon(Icons.explore, 1),
                      label: "",
                    ),
                    BottomNavigationBarItem(
                      icon: buildIcon(Icons.camera_alt, 2),
                      label: "",
                    ),
                    BottomNavigationBarItem(
                      icon: buildIcon(Icons.favorite, 3),
                      label: "",
                    ),
                    BottomNavigationBarItem(
                      icon: buildIcon(Icons.message, 4),
                      label: "",
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
