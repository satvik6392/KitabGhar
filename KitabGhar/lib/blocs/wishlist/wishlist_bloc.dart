import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:bloc/bloc.dart';
// import 'models/models.dart';
import 'package:ecommerce/models/models.dart';

part 'wishlist_state.dart';
part 'wishlist_event.dart';

// class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
//   WishlistBloc() : super(WishlistLoading());
//   @override
//   Stream<WishlistState> mapEventtoState(
//     WishlistEvent event,
//   ) async* {
//     if (event is StartWishlist) {
//       yield* _mapStartishlisttoState();
//     } else if (event is AddWishlistProduct) {
//       yield* _mapAddWishlistProducttoState(event, state);
//     } else if (event is RemoveWishlistProduct) {
//       yield* _mapRemoveWishlistProdcuttoState(event, state);
//     }
//   }

//   Stream<WishlistState> _mapStartishlisttoState() async* {
//     yield WishlistLoading();
//     try {
//       await Future<void>.delayed(Duration(seconds: 1));
//       yield const WishlistLoaded();
//     } catch (_) {}
//   }

//   Stream<WishlistState> _mapAddWishlistProducttoState(
//       AddWishlistProduct event, WishlistState state) async* {
//     if (state is WishlistLoaded) {
//       try {
//         yield WishlistLoaded(
//             wishList: WishList(
//                 products: List.from(state.wishList.products)
//                   ..add(event.product)));
//       } catch (_) {}
//     }
//   }

//   Stream<WishlistState> _mapRemoveWishlistProdcuttoState(
//       RemoveWishlistProduct event, WishlistState state) async* {
//     if (state is WishlistLoaded) {
//       try {
//         yield WishlistLoaded(
//             wishList: WishList(
//                 products: List.from(state.wishList.products)
//                   ..remove(event.product)));
//       } catch (_) {}
//     }
//   }
// }

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistLoading()){
    on<LoadWishlist> (_onLoadWishlist);
    on<AddProductToWishlist> (_onAddProductToWishlist);
    on<RemoveProdutFromWishlist> (_onRemoveProdutFromWishlist);
  }

  void _onLoadWishlist(event, Emitter<WishlistState>emit)async{
    emit(WishlistLoading());
    try {
      await Future<void>.delayed(const Duration(seconds: 1));
      emit(WishlistLoaded());
    } catch (_) {
      emit(WishlistError());
    }
  }
  void _onAddProductToWishlist(event, Emitter<WishlistState>emit){
    final state = this.state;
     if (state is WishlistLoaded) {
      try {
        emit(WishlistLoaded(
          wishlist: Wishlist(
            products: List.from(state.wishlist.products)..add(event.product),
          ),
        ),);
      } on Exception {
        emit(WishlistError());
      }
    }
  }
  void _onRemoveProdutFromWishlist(event, Emitter<WishlistState>emit){ final state = this.state;
     if (state is WishlistLoaded) {
      try {
        emit(WishlistLoaded(
          wishlist: Wishlist(
            products: List.from(state.wishlist.products)..remove(event.product),
          ),
        ),);
      } on Exception {
        emit(WishlistError());
      }
    }}
}

  // Stream<WishlistState> _mapWishlistStartedToState() async* {
    
  // }

  // Stream<WishlistState> _mapWishlistProductAddedToState(
  //   WishlistProductAdded event,
  //   WishlistState state,
  // ) async* {
   
  // }

//   Stream<WishlistState> _mapWishlistProductRemovedToState(
//     WishlistProductRemoved event,
//     WishlistState state,
//   ) async* {
//     if (state is WishlistLoaded) {
//       try {
//         yield WishlistLoaded(
//           wishlist: Wishlist(
//             products: List.from(state.wishlist.products)..remove(event.product),
//           ),
//         );
//       } on Exception {
//         yield WishlistError();
//       }
//     }
//   }
// }