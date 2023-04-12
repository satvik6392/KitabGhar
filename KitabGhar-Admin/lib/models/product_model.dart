// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final int id;
  final String name;
  final String category;
  final String description;
  final String imageUrl;
  final bool isRecommended;
  final bool isPopular;
  double price;
  int quantity;
  Product({
    required this.id,
    required this.name,
    required this.category,
    required this.description,
    required this.imageUrl,
    required this.isRecommended,
    required this.isPopular,
    this.price = 0,
    this.quantity = 0,
  });

  @override
  // TODO: implement props
  List<Object> get props {
    return [
      id,
      name,
      category,
      description,
      imageUrl,
      isRecommended,
      isPopular,
      price,
      quantity,
    ];
  }

  Product copyWith({
    int? id,
    String? name,
    String? category,
    String? description,
    String? imageUrl,
    bool? isRecommended,
    bool? isPopular,
    double? price,
    int? quantity,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      isRecommended: isRecommended ?? this.isRecommended,
      isPopular: isPopular ?? this.isPopular,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'category': category,
      'description': description,
      'imageUrl': imageUrl,
      'isRecommended': isRecommended,
      'isPopular': isPopular,
      'price': price,
      'quantity': quantity,
    };
  }

  factory Product.fromSnapshot(DocumentSnapshot snap) {
    return Product(
      id: snap['id'],
      name: snap['name'] ,
      category: snap['category'],
      description: snap['description'],
      imageUrl: snap['imageUrl'],
      isRecommended: snap['isRecommended'],
      isPopular: snap['isPopular'],
      price: snap['price'].toDouble(),
      quantity: snap['quantity'],
    );
  }

  String toJson() => json.encode(toMap());


  @override
  bool get stringify => true;

  static List<Product> products = [
    Product(
        id: 1,
        name: 'Build dont Talk',
        category: 'Business',
        description: 'Things you wish you were taught in your school',
        price: 210.5,
        quantity: 5,
        imageUrl:
            'https://m.media-amazon.com/images/I/71tUrymD+2L._AC_UF1000,1000_QL80_.jpg',
        isRecommended: true,
        isPopular: true),
    Product(
        id: 2,
        quantity: 5,
        name: 'Build dont Talk',
        price: 150.2,
        category: 'Business',
        description: 'Things you wish you were taught in your school',
        imageUrl:
            'https://m.media-amazon.com/images/I/71tUrymD+2L._AC_UF1000,1000_QL80_.jpg',
        isRecommended: true,
        isPopular: true),
    Product(
        id: 3,
        quantity: 5,
        name: 'Build dont Talk',
        category: 'Business',
        price: 150.2,
        description: 'Things you wish you were taught in your school',
        imageUrl:
            'https://m.media-amazon.com/images/I/71tUrymD+2L._AC_UF1000,1000_QL80_.jpg',
        isRecommended: true,
        isPopular: true),
    Product(
        id: 4,
        quantity: 5,
        name: 'Build dont Talk',
        category: 'Business',
        price: 150.5,
        description: 'Things you wish you were taught in your school',
        imageUrl:
            'https://m.media-amazon.com/images/I/71tUrymD+2L._AC_UF1000,1000_QL80_.jpg',
        isRecommended: true,
        isPopular: true),
    Product(
        id: 5,
        quantity: 5,
        name: 'Build dont Talk',
        price: 150.3,
        category: 'Business',
        description: 'Things you wish you were taught in your school',
        imageUrl:
            'https://m.media-amazon.com/images/I/71tUrymD+2L._AC_UF1000,1000_QL80_.jpg',
        isRecommended: true,
        isPopular: true),
    Product(
        id: 6,
        quantity: 5,
        price: 200.2,
        name: 'Build dont Talk',
        category: 'Business',
        description: 'Things you wish you were taught in your school',
        imageUrl:
            'https://m.media-amazon.com/images/I/71tUrymD+2L._AC_UF1000,1000_QL80_.jpg',
        isRecommended: true,
        isPopular: true),
  ];
}
