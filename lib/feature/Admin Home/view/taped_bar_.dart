import 'package:flutter/material.dart';
import 'package:task_managment_app/feature/Admin%20Home/widgets/tap_icon.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TapedIcon(
          color: Colors.black,
          txt: "Users",
          icon: Icons.person,
          onTap: () {},
        ),
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.01,
        ),
        TapedIcon(
          color: Colors.black,
          txt: "Task",
          icon: Icons.book,
          onTap: () {},
        ),
      ],
    );
  }
}
