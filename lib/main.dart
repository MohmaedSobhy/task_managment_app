import 'package:flutter/material.dart';

import 'core/shared/shared_date.dart';
import 'task_managment.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageHelper.init();
  runApp(const TaskMangmentApp());
}
