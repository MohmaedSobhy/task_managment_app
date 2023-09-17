import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_managment_app/core/localization/app_string.dart';
import 'package:task_managment_app/core/route/route_name.dart';

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
            leading: const Icon(Icons.person),
            title: const Text(AppString.addUser),
            onTap: () {
              Get.toNamed(RouteName.addUser);
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text(AppString.addManager),
            onTap: () {
              Get.toNamed(RouteName.addManger);
            },
          ),
          ListTile(
            leading: const Icon(Icons.dataset_rounded),
            title: const Text(AppString.addDepartment),
            onTap: () {
              Get.toNamed(RouteName.addDepartment);
            },
          ),
          ListTile(
            leading: const Icon(Icons.dataset_rounded),
            title: const Text(AppString.updateDepartment),
            onTap: () {
              Get.toNamed(RouteName.updateDepartment);
            },
          ),
        ],
      ),
    );
  }
}
