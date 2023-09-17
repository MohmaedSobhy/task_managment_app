import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_managment_app/core/route/app_route.dart';
import 'package:task_managment_app/core/route/route_name.dart';
import 'core/color/app_color.dart';

class TaskMangmentApp extends StatelessWidget {
  const TaskMangmentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColor.darkColor,
      ),
      onGenerateRoute: AppRoute.ongenerateRoute,
    );
  }
}
