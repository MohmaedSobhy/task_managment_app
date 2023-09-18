import 'package:flutter/material.dart';

class TapedIcon extends StatelessWidget {
  final String txt;
  final Color color;
  final IconData icon;
  final VoidCallback onTap;
  const TapedIcon({
    super.key,
    required this.color,
    required this.txt,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: color,
          ),
          Text(
            txt,
            style: TextStyle(
              color: color,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
