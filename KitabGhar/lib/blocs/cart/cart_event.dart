// part of 'cart_bloc.dart';

// abstract class CartEvent extends Equatable{
//   const CartEvent();
//   @override
//   List<Object> get props => [];
// }
// class CartStarted extends CartEvent{
//   @override
//   List<Object> get props => [];
// }

// class CartProductAdded extends CartEvent{
//   final Product product;
//   const CartProductAdded(this.product);
//   @override
//   List<Object> get props => [];
// }

// class CartProductRemoved extends CartEvent{
//   final Product product;
//   const CartProductRemoved(this.product);
//   @override
//   List<Object> get props => [];
// }

part of 'cart_bloc.dart';

@immutable
abstract class CartEvent extends Equatable {
  const CartEvent();
}

class LoadCart extends CartEvent {
  @override
  List<Object> get props => [];
}

class AddProduct extends CartEvent {
  final Product product;

  const AddProduct(this.product);

  @override
  List<Object> get props => [product];
}

class RemoveProduct extends CartEvent {
  final Product product;

  const RemoveProduct(this.product);

  @override
  List<Object> get props => [product];
}