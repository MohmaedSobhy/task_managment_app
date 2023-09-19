import 'package:flutter/material.dart';
import 'package:task_managment_app/core/color/app_color.dart';
import '../../../core/localization/app_string.dart';

class DescriptionTaskView extends StatelessWidget {
  const DescriptionTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            const Text(
              AppString.description,
              style: TextStyle(
                color: AppColor.darkColor,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            MaterialButton(
              onPressed: () {},
              child: const Text(
                AppString.tapToEdit,
                style: TextStyle(
                  color: AppColor.gray,
                ),
              ),
            )
          ],
        ),
        Text(
          "Design a 20-minute HIIT workout routine that includes a warm-up, alternating periods of intense exercise and rest, and a cool-down. Specify the exercises, durations, and intensity levels for each interval.",
          style: TextStyle(color: AppColor.gray),
        )
      ],
    );
  }
}
