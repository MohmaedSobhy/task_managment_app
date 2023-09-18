import 'package:flutter/material.dart';
import 'package:task_managment_app/feature/Home/screens/home_screen.dart';
import 'package:task_managment_app/feature/add%20department/screens/add_department.dart';
import 'package:task_managment_app/feature/add%20user/screens/add_user_screen.dart';
import 'package:task_managment_app/feature/update%20department/screens/update_department_screen.dart';
import 'route_name.dart';
import '../../feature/login/screens/login_screen.dart';

abstract class AppRoute {
  static Route? ongenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.login:
        return MaterialPageRoute(builder: (_) {
          return const LoginScreen();
        });
      case RouteName.adminHome:
        return MaterialPageRoute(
          builder: (_) {
            return const HomeScreen();
          },
        );
      case RouteName.addUser:
        return MaterialPageRoute(
          builder: (_) {
            return const AddUserScreen();
          },
        );
      case RouteName.addDepartment:
        return MaterialPageRoute(builder: (_) {
          return const AddDepartmentScreen();
        });
      case RouteName.updateDepartment:
        return MaterialPageRoute(builder: (_) {
          return const UpdateDepartmentScreen();
        });
    }
    return null;
  }
}
