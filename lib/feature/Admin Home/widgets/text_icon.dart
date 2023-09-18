import 'package:flutter/material.dart';
import 'package:task_managment_app/core/color/app_color.dart';

class TextIcon extends StatelessWidget {
  final IconData icon;
  final String txt;
  final Color txtColor;
  final double size;
  const TextIcon(
      {super.key,
      required this.icon,
      required this.txt,
      required this.size,
      required this.txtColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: size,
          color: AppColor.gray,
        ),
        const SizedBox(
          width: 2,
        ),
        Text(
          txt,
          style: TextStyle(
            color: txtColor,
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
        )
      ],
    );
  }
}
