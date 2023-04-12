import 'package:flutter/material.dart';
import 'package:ecommerce/Widgets/widgets.dart';
import 'package:ecommerce/models/models.dart';

class CatalogScreen extends StatelessWidget {
  static const String routeName = '/catalog';
  static Route route({required Category category}) {
    return MaterialPageRoute(
      builder: (_) => CatalogScreen(category: category),
      settings: RouteSettings(name: routeName),
    );
  }

  final Category category;
  const CatalogScreen({required this.category, super.key});
  @override
  Widget build(BuildContext context) {
    final List<Product> categoryProducts = Product.products
        .where((product) => (product.category == category.name))
        .toList();
    return Scaffold(
      appBar: CustomAppBar(
        title: category.name,
      ),
      body: GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 1.15),
          itemCount: categoryProducts.length,
          itemBuilder: (BuildContext context, int index) {
            return Center(
              child: ProductCard.catalog(product: categoryProducts[index]),
            );
          }),
      bottomNavigationBar: const CustomNavBar(screen: '/catalog',),
    );
  }
}
