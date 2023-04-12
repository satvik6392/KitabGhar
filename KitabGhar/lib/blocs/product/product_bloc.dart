import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce/models/category_model.dart';
import 'package:ecommerce/models/product_model.dart';
// import 'package:ecommerce/repositories/category/category_repository.dart';
import 'package:ecommerce/repositories/product/product_repository.dart';
import 'package:equatable/equatable.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository _productRepository;
  StreamSubscription? _productSubscription;
  ProductBloc({required ProductRepository productRepository})
      : _productRepository = productRepository,
        super(ProductLoading()){
          on<LoadProducts>(_onLoadProducts);
          on<UpdateProducts>(_onUpdateProducts);
        }
 
  

  void _onLoadProducts (event, Emitter<ProductState> emit) async {
    _productSubscription?.cancel();
    _productSubscription = _productRepository
        .getAllProducts()
        .listen((products) => add(UpdateProducts(products)));
  }
  void _onUpdateProducts (event,Emitter<ProductState> emit) async{
    emit(ProductLoaded(products: event.products));
  }
}
