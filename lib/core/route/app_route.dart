import 'package:flutter/material.dart';
import 'package:task_managment_app/core/route/route_name.dart';
import 'package:task_managment_app/feature/login/screens/login_screen.dart';

abstract class AppRoute {
  static Route? ongenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.login:
        return MaterialPageRoute(builder: (_) {
          return const LoginScreen();
        });
    }
    return null;
  }
}
