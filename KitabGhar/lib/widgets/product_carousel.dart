import 'package:flutter/material.dart';
import 'package:ecommerce/models/models.dart';
import 'product_card.dart';

class ProductCarousel extends StatelessWidget {
  final List<Product> products;
  const ProductCarousel({
    required this.products,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: SizedBox(
        height: 165,
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
          itemCount: products.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: ProductCard.catalog(product: products[index]),
            );
          },
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}