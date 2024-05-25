import 'package:flutter/material.dart';
import 'package:flutter_task/src/presentation/screens/add_product_screen.dart';
import 'package:flutter_task/src/presentation/screens/home_screen.dart';

import 'app_router_names.dart';

class AppRouter {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouterNames.rHome:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case AppRouterNames.rAddProduct:
        return MaterialPageRoute(
          builder: (_) => const AddProductScreen(),
        );
      default:
        return null;
    }
  }
}
