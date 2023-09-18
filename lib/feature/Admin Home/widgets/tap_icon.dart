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
          Text(
            txt,
            style: TextStyle(
              color: color,
              fontSize: 15,
            ),
          ),
          Icon(
            icon,
            color: color,
          )
        ],
      ),
    );
  }
}
