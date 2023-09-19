import 'package:flutter/material.dart';
import 'package:task_managment_app/core/color/app_color.dart';

// ignore: must_be_immutable
class RadioItem extends StatelessWidget {
  String text;
  String groubValue;
  // ignore: prefer_typing_uninitialized_variables
  var onChange;
  RadioItem({
    super.key,
    required this.groubValue,
    required this.onChange,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.gray),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Radio(value: text, groupValue: groubValue, onChanged: onChange),
          Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppColor.gray,
              fontSize: 15,
            ),
          )
        ],
      ),
    );
  }
}
