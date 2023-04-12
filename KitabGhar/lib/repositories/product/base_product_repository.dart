// import 'package:ecommerce/models/category_model.dart';
import 'package:ecommerce/models/models.dart';

abstract class BaseProductRepository{
  Stream<List<Product>> getAllProducts();
}