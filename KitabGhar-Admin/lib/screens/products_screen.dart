import 'package:ecommerce_backend/controllers/controllers.dart';
import 'package:ecommerce_backend/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import '../models/models.dart';

class ProductScreen extends StatelessWidget {
  ProductScreen({Key? key}) : super(key: key);
  final ProductController productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 100,
              child: Card(
                margin: EdgeInsets.zero,
                color: Colors.black,
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Get.to(() => NewProductScreen());
                        },
                        icon: const Icon(
                          Icons.add_circle,
                          color: Colors.white,
                        )),
                    const Text(
                      'Add a new Product',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                child: Obx(() => ListView.builder(
                  itemCount: productController.products.length,
                  itemBuilder: (context, index) {
                    print(productController.products[index]);
                    return SizedBox(
                        height: 210,
                        child: ProductCard(
                          product: productController.products[index],
                          index: index,
                        ),
                      );
                  })) 
            )
          ],
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;
  final int index;
  ProductCard({super.key, required this.index, required this.product});

  final ProductController productController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(top: 10),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.name,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              product.description,
              style:
                  const TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                    height: 70,
                    width: 65,
                    child: Image.network(
                      product.imageUrl,
                      fit: BoxFit.cover,
                    )),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const SizedBox(
                            width: 40,
                            child: Text(
                              'Price',
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            width: 170,
                            child: Slider(
                                value: product.price,
                                min: 0,
                                max: 1000,
                                divisions: 10,
                                activeColor: Colors.black,
                                inactiveColor: Colors.black12,
                                onChanged: (value) {
                                  productController.updateProductPrice(
                                      index, product, value);
                                },
                                onChangeEnd: (value)
                                {
                                  productController.saveNewProductPrice(product, 'price', value);
                                },
                                ),
                          ),
                          Text(
                            '${product.price.toStringAsFixed(1)}',
                            style: const TextStyle(
                                fontSize: 10, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 40,
                            child: Text(
                              'Qty',
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            width: 175,
                            child: Slider(
                                value: product.quantity.toDouble(),
                                min: 0,
                                max: 1000,
                                divisions: 10,
                                activeColor: Colors.black,
                                inactiveColor: Colors.black12,
                                onChanged: (value) {
                                  productController.updateProductQuantity(
                                      index, product, value.toInt());
                                },
                                onChangeEnd: (value)
                                {
                                  productController.saveNewProductQuantity(product, 'quantity', value.toInt());
                                },),
                          ),
                          Text(
                            '${product.quantity.toInt()}',
                            style: const TextStyle(
                                fontSize: 10, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
