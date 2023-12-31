import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/localization/app_string.dart';
import '../../../core/route/route_name.dart';

class AdminDrawer extends StatelessWidget {
  final String userName;
  const AdminDrawer({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              userName,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text(AppString.home),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.task),
            title: const Text(AppString.addTask),
            onTap: () {
              Get.toNamed(RouteName.addTask);
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text(AppString.addUser),
            onTap: () {
              Get.toNamed(RouteName.addUser);
            },
          ),
          ListTile(
            leading: const Icon(Icons.dataset_rounded),
            title: const Text(AppString.addDepartment),
            onTap: () {
              Get.toNamed(RouteName.allDepartment);
            },
          ),
        ],
      ),
    );
  }
}
