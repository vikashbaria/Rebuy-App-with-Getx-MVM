import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rebay/controllers/bottom_navigation/bottom_nav_controller.dart';

final BottomNavController bottomController = Get.find();
Widget buildIcon(IconData icon, int index) {
  return Obx(() {
    bool isSelected = bottomController.selectedIndex.value == index;
    return Container(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      decoration: isSelected
          ? BoxDecoration(
              color: Color.fromRGBO(8, 126, 139, 1),
              shape: BoxShape.circle,
            )
          : null,
      child: Icon(
        icon,
        color: isSelected ? Colors.white : Colors.grey,
        size: 22,
      ),
    );
  });
}
