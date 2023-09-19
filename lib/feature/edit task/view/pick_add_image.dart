import 'package:flutter/material.dart';
import 'package:task_managment_app/core/color/app_color.dart';

class PickImage extends StatelessWidget {
  const PickImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height * 0.2,
      color: AppColor.gray,
      alignment: Alignment.center,
      child: const Text(
        "Add Photo",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColor.darkColor,
          fontSize: 24,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
