import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rebay/views/addproduct/add_product_screen.dart';

class HomeController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  RxString userName = "".obs;

  TextEditingController searchbar = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    fetchUserName();
  }

  void addproduct() {
    Get.to(AddProductScreen());
  }

  void fetchUserName() async {
    try {
      String uid = auth.currentUser!.uid;
      DocumentSnapshot userDoc = await firestore
          .collection("users")
          .doc(uid)
          .get();
      if (userDoc.exists) {
        userName.value = userDoc.get("name");
      }
    } catch (e) {
      print("Error fetching user name: $e");
      userName.value = "User";
    }
  }
}

String capitalizeFirstLetter(String s) {
  if (s.isEmpty) return s;
  return s[0].toUpperCase() + s.substring(1).toLowerCase();
}
