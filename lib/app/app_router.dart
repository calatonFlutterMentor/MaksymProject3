// lib/app/app_router.dart
import 'package:calaton_project_3/app/screens/home/home_factory.dart';
import 'package:calaton_project_3/app/screens/login/login_factory.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => LoginFactory.build());
      case '/home':
        return MaterialPageRoute(
            builder: (_) => HomeScreenFactory.buildHomeScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
