import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'product_model.dart';

class Wishlist extends Equatable{
final List<Product> products;
const Wishlist({this.products = const <Product> []});
  @override
  // TODO: implement props
  List<Object?> get props => [products];
}