import 'package:ecommerce/blocs/cart/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/models/models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class CartProductCard extends StatelessWidget {
  final Product product;
  final int quantity;
  const CartProductCard({super.key, required this.product,required this.quantity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Image.network(
            product.imageUrl,
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(fontSize: 12, color: Colors.black),
                ),
                Text(
                  '\$${product.price}',
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(fontSize: 12, color: Colors.black),
                )
              ],
            ),
          ),
          SizedBox(
            width: 10,
          ),
          BlocBuilder<CartBloc,CartState>(builder: (context, state) {
            return Row(children: [
            IconButton(onPressed: () {
              context.read<CartBloc>().add(RemoveProduct(product));
            }, icon: Icon(Icons.remove_circle)),
            Text(
              '$quantity',
              style: Theme.of(context)
                  .textTheme
                  .displaySmall!
                  .copyWith(fontSize: 12, color: Colors.black),
            ),
            IconButton(onPressed: () {
              context.read<CartBloc>().add(AddProduct(product));
            }, icon: Icon(Icons.add_circle))
          ]);
          }),
          
        ],
      ),
    );
  }
}
