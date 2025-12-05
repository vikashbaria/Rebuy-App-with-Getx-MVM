import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rebay/views/likeditems/likeditems_screen.dart';
import 'package:rebay/views/message/message_screen.dart';
import '../../views/explore/explore_screen.dart';
import '../../views/mylistings/mylistings_screen.dart';

class BottomNavController extends GetxController {
  RxInt selectedIndex = 0.obs;

  final List<Widget> screens = [
    ExploreScreen(),
    MyListingsScreen(),
    LikedItemsScreen(),
    MessageScreen(),
  ];

  void changeIndex(int index) {
    selectedIndex.value = index;
  }

  void goToPage(int index) {
    selectedIndex.value = index;
  }
}
