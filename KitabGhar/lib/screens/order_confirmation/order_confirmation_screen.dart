// import 'dart:html';

import 'package:ecommerce/models/models.dart';
import 'package:ecommerce/widgets/widgets.dart';
// import 'package:ecommerce/widgets/custom_appbar.dart';
// import 'package:ecommerce/widgets/custom_navbar.dart';
// import 'package:ecommerce/widgets/order_summary.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OrderConfirmation extends StatelessWidget {
  static const String routeName = '/order-confirmation';

  static Route route() {
    return MaterialPageRoute(
        builder: (context) => OrderConfirmation(),
        settings: RouteSettings(name: routeName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Order Confirmation'),
      bottomNavigationBar: CustomNavBar(screen: routeName),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(children: [
              Container(
                color: Colors.black,
                width: double.infinity,
                height: 300,
              ),
              Positioned(
                  left: (MediaQuery.of(context).size.width - 100) / 2,
                  top: 110,
                  child: SizedBox(
                      height: 100,
                      width: 100,
                      child: SvgPicture.asset(
                        "assets/svgs/garland.svg",
                      ))),
              Positioned(
                  top: 250,
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  // left: ,
                  child: Text(
                    'Your Order is Complete!',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(color: Colors.white, fontSize: 14),
                  )),
            ]),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "ORDER CODE: #k34-bfk",
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(color: Colors.black, fontSize: 16),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Thank you for purchasing on KITABGHAR",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: Colors.black, fontSize: 14),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "ORDER CODE: #k34-bfk",
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(color: Colors.black, fontSize: 16),
                  ),
                  OrderSummary(),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Order Details",
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(color: Colors.black, fontSize: 16),
                  ),
                  Divider(
                    thickness: 2,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  ListView(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      ProductCard.summary(product: Product.products[0],quantity: 2,),
                      ProductCard.summary(product: Product.products[2],quantity: 5,),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

