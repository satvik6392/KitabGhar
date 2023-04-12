// import 'dart:js';
import 'package:ecommerce/widgets/widgets.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pay/pay.dart';

class PaymentSelection extends StatelessWidget {
  static const String routeName = '/payment-selection';
  static Route route() {
    return MaterialPageRoute(
        builder: (context) => PaymentSelection(),
        settings: RouteSettings(name: routeName));
  }

  const PaymentSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Payment Selection'),
      bottomNavigationBar: CustomNavBar(screen: routeName),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          RawGooglePayButton(
            type: GooglePayButtonType.pay,
            onPressed: (){},
          )
         ],
      )
    );
  }
}
