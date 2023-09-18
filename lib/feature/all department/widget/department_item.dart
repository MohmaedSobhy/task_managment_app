import 'package:flutter/material.dart';

import '../../../core/color/app_color.dart';
import '../../../core/model/department.dart';

class CardDepartmentItem extends StatelessWidget {
  final Department department;
  const CardDepartmentItem({super.key, required this.department});

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
