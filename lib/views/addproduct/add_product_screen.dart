import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rebay/controllers/product_controller/product_controller.dart';
import 'package:rebay/utils/colors.dart';
import 'package:rebay/utils/global_widgets/global_header.dart';
import 'package:rebay/views/homescreen/home_screen.dart';
import 'package:rebay/views/sidebar/sidebar_screen.dart';
import '../../models/product_model.dart';

// ignore: must_be_immutable
class AddProductScreen extends StatelessWidget {
  final ProductController c = Get.put(ProductController());

  var category = "new_arrival".obs;
  var isOriginal = false.obs;

  AddProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 70, left: 22, right: 22),
        child: Column(
          children: [
            GlobalHeader(
              title: "Add Product",
              onBackTap: () {
                Get.offAll(() => HomeScreen());
              },
              rightWidgets: [
                IconButton(
                  onPressed: () {
                    Get.to(SidebarPage());
                  },
                  icon: const Icon(Icons.menu, size: 30),
                ),
              ],
            ),
            const SizedBox(height: 20),
            TextField(
              controller: c.imageUrlController,
              decoration: InputDecoration(
                labelText: "Image URL",
                hintText: "Enter image URL",
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                final url = c.imageUrlController.text.trim();
                if (url.isNotEmpty && !c.imageUrls.contains(url)) {
                  c.imageUrls.add(url);
                  c.imageUrlController.clear();
                }
              },
              child: Text("Add Image URL"),
            ),
            SizedBox(height: 10),

            Obx(() {
              if (c.imageUrls.isEmpty) return SizedBox();
              return SizedBox(
                height: 120,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: c.imageUrls
                      .map(
                        (url) => Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Image.network(url, width: 120),
                        ),
                      )
                      .toList(),
                ),
              );
            }),

            SizedBox(height: 20),

            TextField(
              controller: c.nameController,
              decoration: InputDecoration(labelText: "Product Name"),
            ),
            TextField(
              controller: c.priceController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Price"),
            ),
            TextField(
              controller: c.brandController,
              decoration: InputDecoration(labelText: "Brand"),
            ),
            TextField(
              controller: c.yearController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Year"),
            ),
            TextField(
              controller: c.descriptionController,
              decoration: InputDecoration(labelText: "Description"),
            ),

            SizedBox(height: 10),

            Obx(
              () => DropdownButton<String>(
                value: category.value,
                items: [
                  DropdownMenuItem(
                    value: "new_arrival",
                    child: Text("New Arrival"),
                  ),
                  DropdownMenuItem(
                    value: "recent",
                    child: Text("Recently Viewed"),
                  ),
                ],
                onChanged: (val) {
                  if (val != null) category.value = val;
                },
              ),
            ),

            Obx(
              () => SwitchListTile(
                value: isOriginal.value,
                title: Text("Is Original?"),
                onChanged: (val) => isOriginal.value = val,
              ),
            ),

            SizedBox(height: 20),

            Obx(
              () => c.loading.value
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () async {
                        if (c.nameController.text.isEmpty ||
                            c.priceController.text.isEmpty ||
                            c.brandController.text.isEmpty ||
                            c.yearController.text.isEmpty ||
                            c.descriptionController.text.isEmpty ||
                            c.imageUrls.isEmpty) {
                          Get.snackbar("Error", "Please fill all fields");
                          return;
                        }

                        var product = ProductModel(
                          id: "",
                          name: c.nameController.text,
                          price: int.parse(c.priceController.text),
                          description: c.descriptionController.text,
                          category: category.value,
                          year: int.parse(c.yearController.text),
                          brand: c.brandController.text,
                          isOriginal: isOriginal.value,
                          imageUrls: c.imageUrls.toList(),
                        );

                        await c.addProduct(product);

                        c.resetFields();
                      },
                      child: Text("Save Product"),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
