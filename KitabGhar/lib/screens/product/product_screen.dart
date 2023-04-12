import 'dart:ffi';

import 'package:ecommerce/blocs/wishlist/wishlist_bloc.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/Widgets/widgets.dart';
import 'package:ecommerce/models/models.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:bloc/bloc.dart';
import 'package:ecommerce/blocs/blocs.dart';
class ProductScreen extends StatelessWidget {
  static const String routeName = '/ProductScreen';
  static Route route({
    required Product product,
  }) {
    return MaterialPageRoute(
      builder: (_) => ProductScreen(
        product: product,
      ),
      settings: RouteSettings(name: routeName),
    );
  }

  const ProductScreen({required this.product, super.key});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: product.name,
      ),
      body: ListView(
        children: [
          CarouselSlider(
              options: CarouselOptions(
                aspectRatio: 1.5,
                viewportFraction: 0.9,
                enlargeCenterPage: true,
                // enableInfiniteScroll: false,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
              ),
              items: [HeroCarouselCard(product: product)]),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Stack(
              children: [
                Container(
                    alignment: Alignment.bottomCenter,
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    color: Colors.black.withAlpha(50)),
                Container(
                  margin: const EdgeInsets.all(5.0),
                  alignment: Alignment.bottomCenter,
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  color: Colors.black,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child:Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // children: [
                            children: [Expanded(
                              flex: 4,
                              child: Text(
                                product.name,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall!
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text('${product.price}',
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall!
                                    .copyWith(color: Colors.white),
                              ),
                            )
                            
                            ]
                          // ],
                        ),
                      
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ExpansionTile(
              title: Text(
                'Product Information',
                style: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(color: Colors.black),
              ),
              children: [
                ListTile(
                  title: Text(
                    "lorem5 bjsh bfhsbgjh gbjhbgjbfsg gjhjfk hgjshisjdhf dfjhfjkhf fjhsiudfhiusfh",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: Colors.black),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ExpansionTile(
              title: Text(
                'Delivery Information',
                style: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(color: Colors.black),
              ),
              children: [
                ListTile(
                  title: Text(
                    "lorem5 bjsh bfhsbgjh gbjhbgjbfsg gjhjfk hgjshisjdhf dfjhfjkhf fjhsiudfhiusfh",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: Colors.black),
                  ),
                )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Container(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.share,
                    color: Colors.white,
                  )),
              BlocBuilder<WishlistBloc,WishlistState>(
                builder: (BuildContext context, state) {
                  return IconButton(
                  onPressed: () {
                    context.read<WishlistBloc>().add(AddProductToWishlist(product));
                    final snackBar =  SnackBar(content: Text('Added to your wishlist!'),duration: Duration(seconds: 1),);
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  icon: Icon(Icons.favorite),
                  color: Colors.white,
                );
                 },
              ),
              BlocBuilder<CartBloc,CartState>(builder: (context,state){
                return ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.white),
                onPressed: () {
                  context.read<CartBloc>().add(AddProduct(product));
                  Navigator.pushNamed(context, '/cart');
                },
                child: Text(
                  'ADD TO CART',
                  style: Theme.of(context)
                      .textTheme
                      .headline3!.copyWith(color: Colors.black)
                ),
              );
              }),
              
            ],
          ),
        ),
      ),
    );
  }
}
