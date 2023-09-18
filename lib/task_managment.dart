import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_managment_app/feature/User%20Home/screens/user_home_screen.dart';
import 'core/color/app_color.dart';
import 'core/route/app_route.dart';

class TaskMangmentApp extends StatelessWidget {
  const TaskMangmentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColor.darkColor,
      ),
      //onGenerateRoute: AppRoute.ongenerateRoute,
      home: UserHomeScreen(),
    );
  }
}
