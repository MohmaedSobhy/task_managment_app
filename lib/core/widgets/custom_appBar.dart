import 'package:flutter/material.dart';
import 'package:task_managment_app/core/widgets/custome_header_date.dart';

import 'circle_precent_indicator.dart';

class CustomAppBar extends StatelessWidget {
  final VoidCallback onTap;
  const CustomAppBar({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0.0,
      leading: Builder(builder: (context) {
        return IconButton(
          onPressed: onTap,
          icon: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
        );
      }),
      title: CustomeDate(
        date: DateTime.now().toString().substring(0, 10),
      ),
      actions: [
        CircleIndicator(
          color: Colors.green,
          text: "9/20",
          backGroud: Colors.green.shade100,
        ),
        CircleIndicator(
          color: Colors.orange,
          text: "4/20",
          backGroud: Colors.orange.shade100,
        ),
        CircleIndicator(
          color: Colors.red,
          text: "3/20",
          backGroud: Colors.red.shade100,
        ),
      ],
    );
  }
}
