import 'package:bike_shoping_app/features/product/screens/product_list_screen.dart';
import 'package:flutter/material.dart';
import '../core/utils/error_screen.dart';
import 'routes.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.initial:
        return MaterialPageRoute(builder: (_) => const ProductListScreen());
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
