import 'package:flutter/material.dart';
import 'package:rebay/models/product_model.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;

  const ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      margin: EdgeInsets.only(right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                image: NetworkImage(product.imageUrls.first),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(product.name, style: TextStyle(fontWeight: FontWeight.bold)),
          Text("₹ ${product.price}"),
        ],
      ),
    );
  }
}
