import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../../models/product_model.dart';

class ProductController extends GetxController {
  var products = <ProductModel>[].obs;
  var loading = false.obs;

  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final brandController = TextEditingController();
  final yearController = TextEditingController();
  final descriptionController = TextEditingController();
  final imageUrlController = TextEditingController();

  // For URL-only images
  var imageUrls = <String>[].obs;

  // Image picker
  final picker = ImagePicker();

  // Pick multiple images from device
  Future<void> pickImages() async {
    try {
      final picked = await picker.pickMultiImage();
      if (picked != null && picked.isNotEmpty) {
        imageUrls.clear();
        for (var img in picked) {
          imageUrls.add(img.path); // store local paths temporarily
        }
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to pick images: $e");
    }
  }

  Future<List<String>> uploadImagesToFirebase() async {
    List<String> urls = [];
    try {
      for (var path in imageUrls) {
        final file = File(path);
        final ref = FirebaseStorage.instance.ref(
          "products/${DateTime.now().microsecondsSinceEpoch}.jpg",
        );
        await ref.putFile(file);
        String url = await ref.getDownloadURL();
        urls.add(url);
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to upload images: $e");
    }
    return urls;
  }

  Future<void> addProduct(ProductModel product) async {
    loading.value = true;
    try {
      await FirebaseFirestore.instance.collection("products").add({
        ...product.toMap(),
        "createdAt": FieldValue.serverTimestamp(),
      });

      Get.snackbar(
        "Success",
        "Product added",
        duration: Duration(seconds: 3),
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        backgroundColor: Colors.green,
      );

      // Only clear image URLs after product is added, not immediately
      imageUrls.clear();
    } catch (e) {
      Get.snackbar("Error", "Failed to add product: $e");
    } finally {
      loading.value = false;
    }
  }

  // Reset all text fields
  void resetFields() {
    nameController.clear();
    priceController.clear();
    brandController.clear();
    yearController.clear();
    descriptionController.clear();
    imageUrlController.clear();
  }

  Stream<List<ProductModel>> getRecentProducts() {
    return FirebaseFirestore.instance
        .collection("products")
        .orderBy("createdAt", descending: true)
        .limit(5)
        .snapshots()
        .map(
          (query) => query.docs
              .map((doc) => ProductModel.fromMap(doc.id, doc.data()))
              .toList(),
        );
  }

  Stream<List<ProductModel>> getProducts(String category) {
    return FirebaseFirestore.instance
        .collection("products")
        .where("category", isEqualTo: category)
        .snapshots()
        .map(
          (query) => query.docs
              .map((doc) => ProductModel.fromMap(doc.id, doc.data()))
              .toList(),
        );
  }
}
