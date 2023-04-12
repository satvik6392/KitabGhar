import 'dart:async';

import 'package:ecommerce/models/category_model.dart';
import 'package:ecommerce/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/Widgets/widgets.dart';
import 'package:ecommerce/models/models.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = '/splash';
  static Route route() {
    return MaterialPageRoute(
      builder: (_) => SplashScreen(),
      settings: RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
   Timer(Duration(seconds: 3),()=>(Navigator.pushNamed(context, '/')));
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          SizedBox(height: 150,width: 130, child: Image.asset("assets/images/logo.png",fit: BoxFit.contain,),),
          SizedBox(height: 10,),
          Container(child: Text('Book Store',style: Theme.of(context).textTheme.displayMedium!.copyWith(color: Colors.black),),)
        ]),
      ),
    );
  }
}
