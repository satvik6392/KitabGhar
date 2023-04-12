import 'package:ecommerce_backend/models/models.dart';
import 'package:ecommerce_backend/services/database_service.dart';
import 'package:ecommerce_backend/services/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ecommerce_backend/controllers/controllers.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class NewProductScreen extends StatelessWidget {
  final ProductController productController = Get.find();
  NewProductScreen({super.key});
  StorageService storage = StorageService();
  DatabaseService database = DatabaseService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a Product'),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 100,
                  child: Card(
                    margin: EdgeInsets.zero,
                    color: Colors.black,
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () async {
                              ImagePicker _picker = ImagePicker();
                              final XFile? _image = await _picker.pickImage(
                                  source: ImageSource.gallery);
                              if (_image == null) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text('No image was selected.'),
                                  duration: Duration(seconds: 1),
                                ));
                              }
                              if (_image != null) {
                                await storage.uploadImage(_image);
                                var imageUrl =
                                    await storage.getDownloadUrl(_image.name);
                                productController.newProduct.update(
                                    'imageUrl', (_) => imageUrl,
                                    ifAbsent: () => imageUrl);
                                // print(productController.newProduct['imageUrl']);
                              }
                            },
                            icon: const Icon(
                              Icons.add_circle,
                              color: Colors.white,
                            )),
                        const Text(
                          'Add an Image',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Product Information',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                _buildTextFormField('Book Name', 'name', productController),
                _buildTextFormField('Book Id', 'id', productController),
                _buildTextFormField(
                    'Book Description', 'description', productController),
                _buildTextFormField(
                    'Book Category', 'category', productController),
                const SizedBox(
                  height: 10,
                ),
                _buildSlider('Price', 'price', productController,
                    productController.price),
                _buildSlider('Quantity', 'quantity', productController,
                    productController.quantity),
                const SizedBox(
                  height: 10,
                ),
                _buildCheckbox(
                  'Recommended',
                  'isRecommended',
                  productController,
                  productController.isRecommended,
                ),
                _buildCheckbox(
                  'Popular',
                  'isPopular',
                  productController,
                  productController.isPopular,
                ),
                Center(
                  child: ElevatedButton(
                      onPressed: () {
                        database.addProduct(Product(
                            price: productController.newProduct['price'],
                            quantity: productController.newProduct['quantity'].toInt(),
                            id: int.parse(productController.newProduct['id']),
                            name: productController.newProduct['name'],
                            category: productController.newProduct['category'],
                            description: productController.newProduct['description'],
                            imageUrl: productController.newProduct['imageUrl'],
                            isRecommended: productController.newProduct['isRecommended'],
                            isPopular: productController.newProduct['isPopular']));
                      },
                      style: ElevatedButton.styleFrom(primary: Colors.black),
                      child: const Text(
                        'Save',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row _buildCheckbox(String title, String name,
      ProductController productController, bool? controllerValue) {
    return Row(
      children: [
        SizedBox(
            width: 125,
            child: Text(
              title,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            )),
        Checkbox(
            value: (controllerValue == null) ? false : controllerValue,
            checkColor: Colors.black,
            activeColor: Colors.black12,
            onChanged: (value) {
              productController.newProduct
                  .update(name, (_) => value, ifAbsent: () => value);
            }),
      ],
    );
  }

  Row _buildSlider(String title, String name,
      ProductController productController, double? controllerValue) {
    return Row(
      children: [
        SizedBox(
            width: 75,
            child: Text(
              title,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            )),
        Expanded(
          child: Slider(
              value: controllerValue == null ? 0 : controllerValue,
              min: 0,
              max: 1000,
              divisions: 10,
              activeColor: Colors.black,
              inactiveColor: Colors.black12,
              onChanged: (value) {
                productController.newProduct
                    .update(name, (_) => value, ifAbsent: () => value);
              }),
        ),
      ],
    );
  }

  TextFormField _buildTextFormField(
    String hintText,
    String name,
    ProductController productController,
  ) =>
      TextFormField(
          decoration: InputDecoration(hintText: hintText),
          onChanged: (value) {
            productController.newProduct
                .update(name, (_) => value, ifAbsent: () => value);
          });
}
