import 'package:flutter/material.dart';

import '../models/models.dart';

class OrderSummaryProductCard extends StatelessWidget {
  const OrderSummaryProductCard({
    required this.product,
    required this.quantity,
    super.key,
  });

  final Product product;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
            height: 80,
            width: 100,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(
                          color: Colors.black, fontSize: 12),
                ),
                Text(
                  'Qty: ${quantity}',
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(
                          color: Colors.black, fontSize: 12),
                )
              ],
            ),
          ),
          Expanded(
              child: Text(
            '${product.price}',
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(color: Colors.black, fontSize: 13),
          ))
        ],
      ),
    );
  }
}
