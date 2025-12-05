import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rebay/models/product_model.dart';

class ViewProductController extends GetxController {
  var product = Rxn<ProductModel>();
  var similarProducts = <ProductModel>[].obs;
  var isLoading = true.obs;

  // Fetch product by ID
  Future<void> fetchProduct(String productId) async {
    isLoading.value = true;
    try {
      final doc = await FirebaseFirestore.instance
          .collection('products')
          .doc(productId)
          .get();

      if (doc.exists) {
        product.value = ProductModel.fromMap(
          doc.id,
          doc.data()! as Map<String, dynamic>,
        );

        // Fetch similar products
        fetchSimilarProducts(product.value!.category);
      }
    } finally {
      isLoading.value = false;
    }
  }

  // Fetch similar products by category
  Future<void> fetchSimilarProducts(String category) async {
    final snapshot = await FirebaseFirestore.instance
        .collection('products')
        .where('category', isEqualTo: category)
        .limit(10)
        .get();

    similarProducts.value = snapshot.docs
        .map(
          (e) => ProductModel.fromMap(e.id, e.data() as Map<String, dynamic>),
        )
        .where((p) => p.id != product.value!.id)
        .toList();
  }
}
