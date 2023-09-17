import 'package:flutter/material.dart';
import 'package:task_managment_app/core/shared/shared_date.dart';
import 'task_managment.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  runApp(const TaskMangmentApp());
}
