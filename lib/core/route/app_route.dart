import 'package:flutter/material.dart';
import 'package:task_managment_app/feature/add%20user/screens/add_user_screen.dart';
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
      case RouteName.addUser:
        return MaterialPageRoute(builder: (_) {
          return AddUserScreen();
        });
    }
    return null;
  }
}
