import 'package:ecommerce/blocs/wishlist/wishlist_bloc.dart';
import 'package:ecommerce/models/models.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/Widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:bloc/bloc.dart';

class WishlistScreen extends StatelessWidget {
  static const String routeName = '/WishlistScreen';
  static Route route() {
    return MaterialPageRoute(
      builder: (_) => WishlistScreen(),
      settings: RouteSettings(name: routeName),
    );
  }

  const WishlistScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "WishList",
      ),
      body: BlocBuilder<WishlistBloc, WishlistState>(
        builder: (context, state) {
          if (state is WishlistLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is WishlistLoaded) {
            return GridView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1, childAspectRatio: 2.2),
                itemCount: state.wishlist.products.length,
                itemBuilder: (BuildContext context, int index) {
                  return
                      // padding: const EdgeInsets.only(bottom: 8.0),
                      Center(
                    child: ProductCard.wishlist(
                      product: state.wishlist.products[index],
                      // widthFactor: 1.1,
                      // leftPosition: 100,
                      isWishlist: true,
                    ),
                  );
                  //
                });
          } else {
            return Text('Sonething Went Wrong');
          }
        },
      ),
      bottomNavigationBar: CustomNavBar(screen: '/wishlist',),
    );
  }
}
