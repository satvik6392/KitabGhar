import 'package:ecommerce_backend/controllers/controllers.dart';
import 'package:ecommerce_backend/controllers/order_controller.dart';
import 'package:ecommerce_backend/models/models.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

class OrdersScreen extends StatelessWidget {
  OrdersScreen({super.key});
  final OrderControlller orderControlller = Get.put(OrderControlller());
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders'),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () => ListView.builder(
                  itemCount: orderControlller.pendingOrders.length,
                  itemBuilder: (BuildContext context,int index) {
                    return OrderCard(order: orderControlller.pendingOrders[index]);
                  }),
            ),
          )
        ],
      ),
    );
  }
}

class OrderCard extends StatelessWidget {
  OrderCard({required this.order, super.key});
  final ProductController productController = Get.find();
  final Order order;
  final OrderControlller orderControlller = Get.find();

  @override
  Widget build(BuildContext context) {
    var products = productController.products
        .where((product) => order.productIds.contains(product.id))
        .toList();

    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Card(
        margin: EdgeInsets.zero,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Order Id: ${order.id}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    DateFormat('dd-MM-yy').format(order.createdAt),
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: products.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 50,
                          width: 50,
                          child: Image.network(
                            products[index].imageUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              products[index].name,
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                                width: 250,
                                child: Text(
                                  products[index].description,
                                  overflow: TextOverflow.clip,
                                  maxLines: 2,
                                  style: const TextStyle(
                                    fontSize: 12,
                                  ),
                                ))
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        'Delivery Fee: ${order.deliveryFee}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Total: ${order.total}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  order.isAccepted?
                  ElevatedButton(
                      onPressed: () {
                        orderControlller.updateOrder(order, 'isDelivered', !order.isDelivered);
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                          minimumSize: const Size(150, 40)),
                      child: const Text(
                        'Deliver',
                        style: TextStyle(fontSize: 12),
                      )):ElevatedButton(
                      onPressed: () {
                        orderControlller.updateOrder(order, 'isAccepted', !order.isAccepted);
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                          minimumSize: const Size(150, 40)),
                      child: const Text(
                        'Accept',
                        style: TextStyle(fontSize: 12),
                      )),
                  ElevatedButton(
                      onPressed: () {
                        orderControlller.updateOrder(order, 'isCancelled', !order.isCancelled);
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                          minimumSize: const Size(150, 40)),
                      child: const Text(
                        'Cancel',
                        style: TextStyle(fontSize: 12),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
