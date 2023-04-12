// import 'package:ecommerce/blocs/blocs.dart';
// import 'package:ecommerce/blocs/cart/cart_bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:ecommerce/models/models.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class ProductCard extends StatelessWidget {
//   const ProductCard.catalog({
//     super.key,
//     this.quantity,
//     this.leftPosition = 5,
//     this.widthFactor = 2.5,
//     this.height = 150,
//     this.isCatalog = true,
//     this.isCart = false,
//     this.isWishlist = false,
//     this.isSummary = false,
//     this.iconcolor = Colors.white,
//     this.fontcolor = Colors.white,
//     required this.product,
//   });
//   const ProductCard.cart({
//     super.key,
//     this.quantity,
//     this.leftPosition = 5,
//     this.widthFactor = 2.25,
//     this.height = 80,
//     this.isCatalog = false,
//     this.isCart = true,
//     this.isWishlist = false,
//     this.isSummary = false,
//     this.iconcolor = Colors.white,
//     this.fontcolor = Colors.white,
//     required this.product,
//   });
//   const ProductCard.wishlist({
//     super.key,
//     this.quantity,
//     this.leftPosition = 5,
//     this.widthFactor = 1.1,
//     this.height = 150,
//     this.isCatalog = false,
//     this.isCart = false,
//     this.isWishlist = true,
//     this.isSummary = false,
//     this.iconcolor = Colors.white,
//     this.fontcolor = Colors.white,
//     required this.product,
//   });
//   const ProductCard.summary({
//     super.key,
//     this.quantity,
//     this.leftPosition = 5,
//     this.widthFactor = 2.25,
//     this.height = 80,
//     this.isCatalog = false,
//     this.isCart = false,
//     this.isWishlist = false,
//     this.isSummary = true,
//     this.iconcolor = Colors.black,
//     this.fontcolor = Colors.black,
//     required this.product,
//   });
//   final Product product;
//   final double leftPosition;
//   final double widthFactor;
//   final bool isWishlist;
//   final int? quantity;
//   final double height;
//   final bool isCart;
//   final bool isSummary;
//   final bool isCatalog;
//   final Color iconcolor;
//   final Color fontcolor;

//   @override
//   Widget build(BuildContext context) {
//     final double adjWidth = MediaQuery.of(context).size.width / widthFactor;
//     return InkWell(
//       onTap: () {
//         Navigator.pushNamed(context, '/ProductScreen', arguments: product);
//       },
//       child: Stack(
//         alignment: Alignment.bottomCenter,
//         children: [
//           ProductImage(
//             adjWidth: adjWidth,
//             product: product,
//             height: height,
//           ),
//           ProductBackground(adjWidth: adjWidth, widgets: [
//             ProductInformation(product: product, fontColor: fontcolor),
//             ProdutAtions(product: product, isWishlist: isWishlist,),
//           ]),
//           // Positioned(
//           //   top: 60,
//           //   left: leftPosition,
//           //   child: Container(
//           //     width: adjWidth - 5 - leftPosition,
//           //     height: 80,
//           //     decoration: BoxDecoration(
//           //       color: Colors.black.withAlpha(50),
//           //     ),
//           //   ),
//           // ),
//           // Positioned(
//           //   top: 65,
//           //   left: leftPosition + 5,
//           //   child: Container(
//           //     width: adjWidth - 15 - leftPosition,
//           //     height: 70,
//           //     decoration: const BoxDecoration(
//           //       color: Colors.black,
//           //     ),
//           //     child: Padding(
//           //       padding: const EdgeInsets.all(8.0),
//           //       child: ProdutAtions(product: product, isWishlist: isWishlist),
//           //     ),
//           //   ),
//           // ),
//         ],
//       ),
//     );
//   }
// }

// class ProdutAtions extends StatelessWidget {
//   const ProdutAtions({
//     super.key,
//     // required this.fontColor,
//     required this.product,
//     required this.isWishlist,
//   });
//   // final Color fontColor;
//   final Product product;
//   final bool isWishlist;

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         // SizedBox(height: 1,),
//         // Expanded(
//         //   flex: 3,
//         // child: ProductInformation(product: product,fontColor: fontColor),
//         // ),

//             BlocBuilder<CartBloc, CartState>(builder: (context, state) {
//               if (state is CartLoading) {
//                 return const Center(
//                   child: CircularProgressIndicator(),
//                 );
//               }
//               if (state is CartLoaded) {
//                 return Expanded(
//                     flex: 1,
//                     child: BlocBuilder<CartBloc, CartState>(
//                       builder: (context, state) {
//                         if (state is CartLoading) {
//                           return const Center(
//                             child: CircularProgressIndicator(
//                               color: Colors.white,
//                             ),
//                           );
//                         }
//                         if (state is CartLoaded) {
//                           return IconButton(
//                               onPressed: () {
//                                 context
//                                     .read<CartBloc>()
//                                     .add(AddProduct(product));
//                                 // SnackBar(content: content)
//                                 const snackBar = SnackBar(
//                                   content: Text('Added to the Cart'),
//                                   duration: Duration(
//                                     seconds: 1,
//                                   ),
//                                 );
//                                 ScaffoldMessenger.of(context)
//                                     .showSnackBar(snackBar);
//                               },
//                               icon: const Icon(
//                                 Icons.add_circle,
//                                 color: Colors.white,
//                               ));
//                         } else {
//                           return const Text('something went wrong');
//                         }
//                       },
//                     ));
//               } else {
//                 return const Text('something went wrong');
//               }
//             }
//         ),
//         isWishlist
//             ? Expanded(
//                 flex: 1,
//                 child: IconButton(
//                     onPressed: () {
//                       const snackBar = SnackBar(
//                         content: Text('Removed from Wishlist!'),
//                         duration: Duration(seconds: 1),
//                       );
//                       ScaffoldMessenger.of(context).showSnackBar(snackBar);
//                       context
//                           .read<WishlistBloc>()
//                           .add(RemoveProdutFromWishlist(product));
//                     },
//                     icon: const Icon(
//                       Icons.delete,
//                       color: Colors.white,
//                     )))
//             : const SizedBox(),
//       ],
//     );
//   }
// }

// class ProductInformation extends StatelessWidget {
//   const ProductInformation({
//     super.key,
//     required this.product,
//     required this.fontColor,
//     this.isOrderSummary = false,
//     this.quantity,
//   });

//   final Product product;
//   final Color fontColor;
//   final bool isOrderSummary;
//   final int? quantity;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           product.name,
//           style: Theme.of(context)
//               .textTheme
//               .displaySmall!
//               .copyWith(color: Colors.white, fontSize: 14),
//         ),
//         Text(
//           'Rs.${product.price}',
//           style: Theme.of(context).textTheme.displaySmall!.copyWith(
//                 color: Colors.white,
//                 fontSize: 14.0,
//               ),
//         )
//       ],
//     );
//   }
// }

// class ProductImage extends StatelessWidget {
//   const ProductImage({
//     super.key,
//     required this.adjWidth,
//     required this.product,
//     required this.height,
//   });
//   final double height;
//   final double adjWidth;
//   final Product product;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         width: adjWidth,
//         height: height,
//         child: Image.network(product.imageUrl, fit: BoxFit.cover));
//   }
// }

// class ProductBackground extends StatelessWidget {
//   const ProductBackground(
//       {super.key, required this.adjWidth, required this.widgets});
//   final double adjWidth;
//   final List<Widget> widgets;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         width: adjWidth - 10,
//         height: 80,
//         alignment: Alignment.bottomCenter,
//         margin: const EdgeInsets.only(bottom: 5),
//         decoration: BoxDecoration(
//           color: Colors.black.withAlpha(50),
//         ),
//         child: Container(
//           width: adjWidth - 20,
//           height: 70,
//           margin: const EdgeInsets.only(bottom: 5),
//           decoration: const BoxDecoration(
//             color: Colors.black,
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: widgets,
//             ),
//           ),
//         ));
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/blocs/blocs.dart';
import '/models/models.dart';

class ProductCard extends StatelessWidget {
  const ProductCard.catalog({
    Key? key,
    required this.product,
    this.quantity,
    this.widthFactor = 2.25,
    this.height = 150,
    this.isCatalog = true,
    this.isWishlist = false,
    this.isCart = false,
    this.isSummary = false,
    this.iconColor = Colors.white,
    this.fontColor = Colors.white,
  }) : super(key: key);

  const ProductCard.wishlist({
    Key? key,
    required this.product,
    this.quantity,
    this.widthFactor = 1.1,
    this.height = 150,
    this.isCatalog = false,
    this.isWishlist = true,
    this.isCart = false,
    this.isSummary = false,
    this.iconColor = Colors.white,
    this.fontColor = Colors.white,
  }) : super(key: key);

  const ProductCard.cart({
    Key? key,
    required this.product,
    this.quantity,
    this.widthFactor = 2.25,
    this.height = 80,
    this.isCatalog = false,
    this.isWishlist = false,
    this.isCart = true,
    this.isSummary = false,
    this.iconColor = Colors.black,
    this.fontColor = Colors.black,
  }) : super(key: key);

  const ProductCard.summary({
    Key? key,
    required this.product,
    this.quantity,
    this.widthFactor = 2.25,
    this.height = 80,
    this.isCatalog = false,
    this.isWishlist = false,
    this.isCart = false,
    this.isSummary = true,
    this.iconColor = Colors.black,
    this.fontColor = Colors.black,
  }) : super(key: key);

  final Product product;
  final int? quantity;
  final double widthFactor;
  final double height;
  final bool isCatalog;
  final bool isWishlist;
  final bool isCart;
  final bool isSummary;
  final Color iconColor;
  final Color fontColor;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double adjWidth = width / widthFactor;

    return InkWell(
      onTap: () {
        if (isCatalog || isWishlist)
          Navigator.pushNamed(
            context,
            '/ProductScreen',
            arguments: product,
          );
      },
      child: isCart || isSummary
          ? Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Row(
                children: [
                  ProductImage(
                    adjWidth: 100,
                    height: height,
                    product: product,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ProductInformation(
                      product: product,
                      fontColor: fontColor,
                      quantity: quantity,
                      isOrderSummary: isSummary ? true : false,
                    ),
                  ),
                  const SizedBox(width: 10),
                  ProductActions(
                    product: product,
                    isCatalog: isCatalog,
                    isWishlist: isWishlist,
                    isCart: isCart,
                    iconColor: iconColor,
                    quantity: quantity,
                  )
                ],
              ),
            )
          : Stack(
              alignment: Alignment.bottomCenter,
              children: [
                ProductImage(
                  adjWidth: adjWidth,
                  height: height,
                  product: product,
                ),
                ProductBackground(
                  adjWidth: adjWidth,
                  widgets: [
                    ProductInformation(
                      product: product,
                      fontColor: fontColor,
                    ),
                    ProductActions(
                      product: product,
                      isCatalog: isCatalog,
                      isWishlist: isWishlist,
                      isCart: isCart,
                      iconColor: iconColor,
                    )
                  ],
                ),
              ],
            ),
    );
  }
}

class ProductImage extends StatelessWidget {
  const ProductImage({
    Key? key,
    required this.adjWidth,
    required this.height,
    required this.product,
  }) : super(key: key);

  final double adjWidth;
  final double height;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: adjWidth,
      height: height,
      child: Image.network(
        product.imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }
}

class ProductInformation extends StatelessWidget {
  const ProductInformation({
    Key? key,
    required this.product,
    required this.fontColor,
    this.isOrderSummary = false,
    this.quantity,
  }) : super(key: key);

  final Product product;
  final Color fontColor;
  final bool isOrderSummary;
  final int? quantity;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 70,
              child: Expanded(
                flex: 2,
                child: Text(product.name,
                overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: fontColor)),
              ),
            ),
            Expanded(
              child: Text('\$${product.price}',
              overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: fontColor)),
            ),
          ],
        ),
        isOrderSummary
            ? Text(
                'Qty. $quantity',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: fontColor),
              )
            : const SizedBox(),
      ],
    );
  }
}

class ProductActions extends StatelessWidget {
  const ProductActions({
    Key? key,
    required this.product,
    required this.isCatalog,
    required this.isWishlist,
    required this.isCart,
    required this.iconColor,
    this.quantity,
  }) : super(key: key);

  final Product product;
  final bool isCatalog;
  final bool isWishlist;
  final bool isCart;
  final Color iconColor;
  final int? quantity;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartLoading) {
          return Center(
            child: CircularProgressIndicator(color: Colors.white),
          );
        }
        if (state is CartLoaded) {
          IconButton addProduct = IconButton(
              icon: Icon(
                Icons.add_circle,
                color: iconColor,
                // fill: Checkbox.width,
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Added to your Cart!'),
                  ),
                );
                context.read<CartBloc>().add(AddProduct(product));
              },
            
          );

          IconButton removeProduct = IconButton(
            icon: Icon(
              Icons.remove_circle,
              color: iconColor,
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Removed from your Cart!'),
                ),
              );
              context.read<CartBloc>().add(RemoveProduct(product));
            },
          );

          IconButton removeFromWishlist = IconButton(
            icon: Icon(
              Icons.delete,
              color: iconColor,
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Removed from your Wishlist!'),
                ),
              );
              context
                  .read<WishlistBloc>()
                  .add(RemoveProdutFromWishlist(product));
            },
          );

          Text productQuantity = Text(
            '$quantity',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.black),
          );

          if (isCatalog) {
            return Row(children: [addProduct]);
          } else if (isWishlist) {
            return Row(children: [addProduct, removeFromWishlist]);
          } else if (isCart) {
            return Row(children: [removeProduct, productQuantity, addProduct]);
          } else {
            return SizedBox();
          }
        } else {
          return Text('Something went wrong.');
        }
      },
    );
  }
}

class ProductBackground extends StatelessWidget {
  const ProductBackground({
    Key? key,
    required this.adjWidth,
    required this.widgets,
  }) : super(key: key);

  final double adjWidth;
  final List<Widget> widgets;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: adjWidth - 10,
      height: 80,
      margin: const EdgeInsets.only(bottom: 5),
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(color: Colors.black.withAlpha(50)),
      child: Container(
        width: adjWidth - 20,
        height: 70,
        margin: const EdgeInsets.only(bottom: 5),
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(color: Colors.black),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [...widgets],
          ),
        ),
      ),
    );
  }
}
