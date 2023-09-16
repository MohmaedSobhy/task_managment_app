import 'package:flutter/material.dart';
import 'route_name.dart';
import '../../feature/home/screens/home_screen.dart';
import '../../feature/login/screens/login_screen.dart';

abstract class AppRoute {
  static Route? ongenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.login:
        return MaterialPageRoute(builder: (_) {
          return const LoginScreen();
        });
      case RouteName.home:
        return MaterialPageRoute(
          builder: (_) {
            return const HomeScreen();
          },
        );
    }
    return null;
  }
}
