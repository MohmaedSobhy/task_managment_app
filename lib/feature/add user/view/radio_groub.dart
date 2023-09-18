import 'package:flutter/material.dart';
import 'package:task_managment_app/core/color/app_color.dart';

// ignore: must_be_immutable
class CustomeRadioGroup extends StatelessWidget {
  String query;
  final List<String> choises;

  // ignore: prefer_typing_uninitialized_variables
  var onChange;
  CustomeRadioGroup({
    super.key,
    required this.query,
    required this.choises,
    this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(
          choises.length,
          (index) => Expanded(
            child: RadioListTile(
              title: Text(choises[index]),
              activeColor: AppColor.darkColor,
              value: choises[index],
              groupValue: query,
              onChanged: onChange,
            ),
          ),
        ),
      ],
    );
  }
}
// 
