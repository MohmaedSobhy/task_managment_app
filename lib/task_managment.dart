import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_managment_app/core/color/app_color.dart';
import 'package:task_managment_app/feature/login/screens/login_screen.dart';

class TaskMangmentApp extends StatelessWidget {
  const TaskMangmentApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColor.darkColor,
      ),
      home: const LoginScreen(),
    );
  }
}
