import 'package:rebay/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:rebay/controllers/home_controller/home_controller.dart';
import 'package:rebay/controllers/product_controller/product_controller.dart';
import 'package:rebay/controllers/bottom_navigation/bottom_nav_controller.dart';
import 'package:rebay/models/product_model.dart';
import 'package:rebay/utils/global_widgets/bottom_icons.dart';
import 'package:rebay/utils/global_widgets/textformfield.dart';
import 'package:rebay/utils/global_widgets/viewmores.dart';
import 'package:rebay/utils/font.dart';
import 'package:get/get.dart';

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
                  // Header
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
                          onPressed: () => print("Hamburger tapped"),
                        ),
                      ],
                    ),
                  ),

                  // Search
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

                  SizedBox(height: 20),

                  ElevatedButton(
                    onPressed: () {
                      controller.addproduct();
                    },
                    child: Text("Add Product"),
                  ),

                  SizedBox(height: 20),
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
                              child: buildProductCard(product),
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
                              child: buildProductCard(product),
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

      bottomNavigationBar: Obx(() {
        return Container(
          margin: EdgeInsets.only(bottom: 14, left: 12, right: 12),

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
          child: SizedBox(
            height: 100,
            child: BottomNavigationBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              currentIndex: bottomController.selectedIndex.value,
              onTap: bottomController.changeIndex,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.grey,
              showUnselectedLabels: true,
              items: [
                BottomNavigationBarItem(
                  icon: buildIcon(Icons.home, 0),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: buildIcon(Icons.explore, 1),
                  label: "Explore",
                ),
                BottomNavigationBarItem(
                  icon: buildIcon(Icons.list, 2),
                  label: "My Listings",
                ),
                BottomNavigationBarItem(
                  icon: buildIcon(Icons.favorite, 3),
                  label: "Liked",
                ),
                BottomNavigationBarItem(
                  icon: buildIcon(Icons.message, 4),
                  label: "Messages",
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget buildProductCard(ProductModel product) {
    return Container(
      width: 264,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
            child: Image.network(
              product.imageUrls.isNotEmpty ? product.imageUrls[0] : "",
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    fontFamily: AppFonts.secondaryFont,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          "${product.brand} | ",
                          style: TextStyle(
                            fontFamily: AppFonts.secondaryFont,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.primaryColor,
                          ),
                        ),
                        Text(
                          "${product.year}",
                          style: TextStyle(
                            fontFamily: AppFonts.secondaryFont,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "\$${product.price}",
                      style: TextStyle(
                        fontFamily: AppFonts.secondaryFont,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: AppColors.fontcolor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
