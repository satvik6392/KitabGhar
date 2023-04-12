import 'package:ecommerce/models/category_model.dart';
import 'package:ecommerce/models/models.dart';
import 'package:ecommerce/screens/home/home_screen.dart';
import 'package:ecommerce/screens/order_confirmation/order_confirmation_screen.dart';
import 'package:ecommerce/screens/product/product_screen.dart';
import 'package:ecommerce/screens/screens.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    print('this is route: ${settings.name}');
    switch (settings.name) {
      case '/':
        {
          return HomeScreen.route();
          break;
        }
        case '/splash':
        {
          return SplashScreen.route();
        }
      case HomeScreen.routeName:
        {
          return HomeScreen.route();
          break;
        }
      case '/cart':
        {
          return CartScreen.route();
          break;
        }
      case '/catalog':
        {
          return CatalogScreen.route(category: settings.arguments as Category);
          break;
        }
      case '/wishlist':
        return WishlistScreen.route();
        break;
      case '/ProductScreen':
      return ProductScreen.route(product:  settings.arguments as Product);
      case CheckoutScreen.routeName:
      return CheckoutScreen.route();
      case OrderConfirmation.routeName:
      return OrderConfirmation.route();
      case PaymentSelection.routeName:
      return PaymentSelection.route();
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: Text("Error")),
      ),
      settings: RouteSettings(name: '/error'),
    );
  }
}
