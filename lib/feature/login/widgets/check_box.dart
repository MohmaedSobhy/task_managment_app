import 'package:flutter/material.dart';
import 'package:task_managment_app/core/color/app_color.dart';

// ignore: must_be_immutable
class CustomCheckBox extends StatelessWidget {
  final bool value;
  // ignore: prefer_typing_uninitialized_variables
  var onChange;
  final String title;
  CustomCheckBox({
    super.key,
    required this.value,
    required this.onChange,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Checkbox(
          activeColor: AppColor.darkColor,
          value: value,
          onChanged: onChange,
        ),
        Text(
          title,
          style: const TextStyle(
            color: AppColor.darkColor,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
