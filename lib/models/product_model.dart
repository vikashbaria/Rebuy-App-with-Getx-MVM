class ProductModel {
  String id;
  String name;
  int price;
  String description;
  String category;
  int year;
  String brand;
  bool isOriginal;
  List<String> imageUrls;

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.category,
    required this.year,
    required this.brand,
    required this.isOriginal,
    required this.imageUrls,
  });

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "price": price,
      "description": description,
      "category": category,
      "year": year,
      "brand": brand,
      "isOriginal": isOriginal,
      "imageUrls": imageUrls,
    };
  }

  factory ProductModel.fromMap(String id, Map<String, dynamic> data) {
    return ProductModel(
      id: id,
      name: data["name"],
      price: data["price"],
      description: data["description"],
      category: data["category"],
      year: data["year"],
      brand: data["brand"],
      isOriginal: data["isOriginal"],
      imageUrls: List<String>.from(data["imageUrls"]),
    );
  }
}
