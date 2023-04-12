// import 'dart:ffi';
// import 'dart:html';
// import 'package:flutter/material.dart';
// import 'package:ecommerce/models/models.dart';
// import 'package:equatable/equatable.dart';
// import 'package:bloc/bloc.dart';
// part 'cart_event.dart';
// part 'cart_state.dart';

// class CartBloc extends Bloc<CartEvent,CartState>{
//  CartBloc() : super(CartLoading());
//  @override
//  // TODO: implement stream
//   Stream<CartState> mapEventToState (
//     CartEvent event,

//   )async*{
//     if(event is CartStarted)
//     {
//       yield* _mapCartStartedToState();
//     }else if(event is CartProductAdded)
//     {
//       yield* _mapCartProductAddedToState(event,state);
//     }else if(event is CartProductRemoved){
//       yield* _mapCartProductRemovedToState(event,state);
//     }
//   }

//   Stream<CartState> _mapCartStartedToState() async*{
//     yield CartLoading();
//     try{
//       await Future<Void>.delayed(Duration(seconds: 1));
//       yield CartLoaded();
//     }catch(_){}
//   }
//   Stream<CartState> _mapCartProductAddedToState(CartProductAdded event,CartState state)async*{
//     if(state is CartLoaded)
//     {
//       try{
//         yield CartLoaded(cart: Cart(products: List.from(state.cart.products)..add(event.product)));
//       }catch(_){}
//     }

//   }

//  Stream<CartState> _mapCartProductRemovedToState(CartProductRemoved event,CartState state)async*{
//     if(state is CartLoaded)
//     {
//       try{
//         yield CartLoaded(cart: Cart(products: List.from(state.cart.products)..remove(event.product)));
//       }catch(_){}
//     }

//   }


// }


import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../models/models.dart';
// import 'package:flutter_ecommerce_app/models/models.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartLoading()){
    on<LoadCart>(_onLoadCart);
    on<AddProduct>(_onAddProduct);
    on<RemoveProduct>(_onRemoveProduct);
  }

  void _onLoadCart(event, Emitter<CartState> emit) async{
     emit(CartLoading());
    try {
      await Future<void>.delayed(const Duration(seconds: 1));
      emit(CartLoaded());
    } catch (_) {
      emit(CartError());
    }
  }
  void _onAddProduct(event, Emitter<CartState> emit){
    final state = this.state;
    if (state is CartLoaded) {
      try {
        emit(CartLoaded(
          cart: Cart(
            products: List.from(state.cart.products)..add(event.product),
          ),
        ),);
      } on Exception {
        emit(CartError());
      }
    }
  }
  void _onRemoveProduct(event, Emitter<CartState> emit){
     final state = this.state;
    if (state is CartLoaded) {
      try {
        emit(CartLoaded(
          cart: Cart(
            products: List.from(state.cart.products)..remove(event.product),
          ),
        ),);
      } on Exception {
        emit(CartError());
      }
    }
  }

 

  // Stream<CartState> _mapCartStartedToState() async* {
   
  // }

  // Stream<CartState> _mapCartProductAddedToState(
  //   CartProductAdded event,
  //   CartState state,
  // ) async* {
    
  // }

  // Stream<CartState> _mapCartProductRemovedToState(
  //   CartProductRemoved event,
  //   CartState state,
  // ) async* {
  //   if (state is CartLoaded) {
  //     try {
  //       yield CartLoaded(
  //         cart: Cart(
  //           products: List.from(state.cart.products)..remove(event.product),
  //         ),
  //       );
  //     } on Exception {
  //       yield CartError();
  //     }
  //   }
  // }
}