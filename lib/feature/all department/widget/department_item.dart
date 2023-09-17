import 'package:flutter/material.dart';
import 'package:task_managment_app/core/color/app_color.dart';
import 'package:task_managment_app/core/model/department.dart';

class DepartmentItem extends StatelessWidget {
  final Department department;
  const DepartmentItem({super.key, required this.department});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      leading: const Icon(Icons.work),
      title: Text(
        department.name,
        style: const TextStyle(
          fontSize: 15,
          color: AppColor.darkColor,
        ),
      ),
      trailing: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
