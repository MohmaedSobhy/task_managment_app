import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'feature/Admin%20Home/controller/admin_cubit.dart';
import 'core/color/app_color.dart';
import 'core/route/app_route.dart';

class TaskMangmentApp extends StatelessWidget {
  const TaskMangmentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AdminCubit(),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: AppColor.darkColor,
        ),
        onGenerateRoute: AppRoute.ongenerateRoute,
      ),
    );
  }
}
