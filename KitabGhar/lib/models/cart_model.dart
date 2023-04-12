import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'models.dart';

class Cart extends Equatable {
  final List<Product> products;
  const Cart({this.products = const <Product>[]});
  @override
  // TODO: implement props
  List<Object?> get props => [products];

  Map productQuantity(Products){
    var quantity = Map();
    products.forEach((product) {
      if(!quantity.containsKey(product))
      {
        quantity[product] = 1;
      }else{
        quantity[product] += 1;
      }
     });
     return quantity;
  }

  double get subtotal =>
      products.fold(0, (total, current) => total + current.price);
  String get subtotalString => subtotal.toStringAsFixed(2);
  // String get missingString => missingString.toStringAsFixed(2);
  String freeDelivery(subtotal) {
    if (subtotal >= 500) {
      return 'You have free delivery';
    } else {
      double missing = 500.0 - subtotal;
      return 'Add ${missing.toStringAsFixed(2)} to get free delivery';
    }
  }

  double total(subtotal, deliveryFee) {
    return subtotal + deliveryFee;
  }

  String get totalString =>
      total(subtotal, deliveryFee(subtotal)).toStringAsFixed(2);
  String get deliveryFeeString => deliveryFee(subtotal).toStringAsFixed(2);
  double deliveryFee(subtotal) {
    if (subtotal > 500) {
      return 0;
    } else {
      return 10;
    }
  }
  // List<Product> products = [
  //   const Product(
  //       category: 'Business',
  //       imageUrl:
  //           'https://kbimages1-a.akamaihd.net/18b74e17-87ea-4cff-b4d5-dc2ccfdd64ab/1200/1200/False/superhero-comics-1.jpg',
  //       isPopular: true,
  //       isRecommended: true,
  //       name: "Build don't Talk",
  //       price: 150),
  //   const Product(
  //       category: 'Education',
  //       imageUrl:
  //           'https://kbimages1-a.akamaihd.net/18b74e17-87ea-4cff-b4d5-dc2ccfdd64ab/1200/1200/False/superhero-comics-1.jpg',
  //       isPopular: false,
  //       isRecommended: false,
  //       name: "Maths",
  //       price: 200),
  //   const Product(
  //       category: 'Comics',
  //       imageUrl:
  //           'https://kbimages1-a.akamaihd.net/18b74e17-87ea-4cff-b4d5-dc2ccfdd64ab/1200/1200/False/superhero-comics-1.jpg',
  //       isPopular: true,
  //       isRecommended: true,
  //       name: "Superhero Comics",
  //       price: 150),
  //   const Product(
  //       category: 'Comics',
  //       imageUrl:
  //           'https://kbimages1-a.akamaihd.net/18b74e17-87ea-4cff-b4d5-dc2ccfdd64ab/1200/1200/False/superhero-comics-1.jpg',
  //       isPopular: true,
  //       isRecommended: true,
  //       name: "Superhero Comics",
  //       price: 150),
  //   const Product(
  //       category: 'Comics',
  //       imageUrl:
  //           'https://kbimages1-a.akamaihd.net/18b74e17-87ea-4cff-b4d5-dc2ccfdd64ab/1200/1200/False/superhero-comics-1.jpg',
  //       isPopular: true,
  //       isRecommended: true,
  //       name: "Superhero Comics",
  //       price: 150),
  //   const Product(
  //       category: 'Comics',
  //       imageUrl:
  //           'https://kbimages1-a.akamaihd.net/18b74e17-87ea-4cff-b4d5-dc2ccfdd64ab/1200/1200/False/superhero-comics-1.jpg',
  //       isPopular: true,
  //       isRecommended: true,
  //       name: "Superhero Comics",
  //       price: 150),
  //   const Product(
  //       category: 'Syllabus',
  //       imageUrl:
  //           'https://kbimages1-a.akamaihd.net/18b74e17-87ea-4cff-b4d5-dc2ccfdd64ab/1200/1200/False/superhero-comics-1.jpg',
  //       isPopular: false,
  //       isRecommended: true,
  //       name: 'World of Science',
  //       price: 150),
  //   const Product(
  //       category: 'Syllabus',
  //       imageUrl:
  //           'https://kbimages1-a.akamaihd.net/18b74e17-87ea-4cff-b4d5-dc2ccfdd64ab/1200/1200/False/superhero-comics-1.jpg',
  //       isPopular: false,
  //       isRecommended: true,
  //       name: 'World of Science',
  //       price: 150),
  //   const Product(
  //       category: 'Syllabus',
  //       imageUrl:
  //           'https://kbimages1-a.akamaihd.net/18b74e17-87ea-4cff-b4d5-dc2ccfdd64ab/1200/1200/False/superhero-comics-1.jpg',
  //       isPopular: false,
  //       isRecommended: true,
  //       name: 'World of Science',
  //       price: 150),
  //   const Product(
  //       category: 'Syllabus',
  //       imageUrl:
  //           'https://kbimages1-a.akamaihd.net/18b74e17-87ea-4cff-b4d5-dc2ccfdd64ab/1200/1200/False/superhero-comics-1.jpg',
  //       isPopular: false,
  //       isRecommended: true,
  //       name: 'World of Science',
  //       price: 150),
  // ];

  
}
