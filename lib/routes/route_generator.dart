import 'package:bike_shoping_app/features/product/models/product_model.dart';
import 'package:bike_shoping_app/features/product/screens/product_list_screen.dart';
import 'package:bike_shoping_app/features/product/screens/product_view_screen.dart';
import 'package:bike_shoping_app/features/product/screens/shopping_cart_screen.dart';
import 'package:flutter/material.dart';
import '../core/utils/error_screen.dart';
import 'routes.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.initial:
        return MaterialPageRoute(builder: (_) => const ProductListScreen());
      case Routes.productDetail:
        final product = settings.arguments as ProductModel;
        return MaterialPageRoute(
            builder: (_) => ProductViewScreen(product: product));
      case Routes.shoppingpage:
        return MaterialPageRoute(builder: (_) => const ShoppingCartScreen());
      default:
        return _errorRoute();
      // return generateRoute(settings); //remove this and uncomment above
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => const ErrorScreen(),
    );
  }
}
