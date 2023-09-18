import 'package:flutter/material.dart';

import '../color/app_color.dart';
import '../localization/app_string.dart';

class CustomeDate extends StatelessWidget {
  final String date;
  const CustomeDate({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          AppString.today,
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.005,
        ),
        Text(
          date,
          style: const TextStyle(
            color: AppColor.gray,
            fontSize: 12,
          ),
        )
      ],
    );
  }
}
