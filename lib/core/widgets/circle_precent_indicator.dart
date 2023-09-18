import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../color/app_color.dart';

class CircleIndicator extends StatelessWidget {
  final Color color;
  final String text;
  final Color backGroud;
  const CircleIndicator({
    super.key,
    required this.color,
    required this.text,
    required this.backGroud,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 3),
      child: CircularPercentIndicator(
        radius: 25,
        lineWidth: 7,
        center: Text(
          text,
          style: const TextStyle(
            color: AppColor.darkColor,
          ),
        ),
        percent: 3 / 20,
        backgroundColor: color,
        progressColor: backGroud,
      ),
    );
  }
}
