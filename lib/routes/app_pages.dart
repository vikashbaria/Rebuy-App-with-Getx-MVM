import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:rebay/views/Paymentpage/Paymentpage_screen.dart';
import 'package:rebay/views/addproduct/add_product_screen.dart';
import 'package:rebay/views/explore/explore_screen.dart';
import 'package:rebay/views/likeditems/likeditems_screen.dart';
import 'package:rebay/views/loginscreen/login_screen.dart';
import 'package:rebay/views/message/message_screen.dart';
import 'package:rebay/views/mylistings/mylistings_screen.dart';
import 'package:rebay/views/orderconfirmation/onrder_screen.dart';
import 'package:rebay/views/sidebar/sidebar_screen.dart';
import 'package:rebay/views/signupscreen/signup_screen.dart';
import 'package:rebay/views/homescreen/home_screen.dart';
import 'package:rebay/views/splashscreen/splashscreen.dart';

class AppPages {
  static const initail = '/splash';

  static final routes = [
    GetPage(name: '/splash', page: () => Splashscreen()),
    GetPage(name: '/login', page: () => LoginScreen()),
    GetPage(name: '/signup', page: () => Signup()),
    GetPage(name: '/login', page: () => HomeScreen()),
    GetPage(name: '/explorer', page: () => ExploreScreen()),
    GetPage(
      name: '/listing',
      page: () => Scaffold(body: MyListingsScreen()),
    ),
    GetPage(name: '/liked', page: () => LikedItemsScreen()),
    GetPage(name: '/message', page: () => MessageScreen()),
    GetPage(name: '/addproduct', page: () => AddProductScreen()),
    GetPage(name: '/sidebarpage', page: () => SidebarPage()),
    GetPage(
      name: '/payment',
      page: () => Paymentpage(product: Get.arguments['product']),
    ),
    GetPage(
      name: '/ordernow',
      page: () => Ordernow(product: Get.arguments['product']),
    ),
  ];
}
