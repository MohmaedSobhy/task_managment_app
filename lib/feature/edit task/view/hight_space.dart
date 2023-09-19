import 'package:flutter/material.dart';

class SpaceHight extends StatelessWidget {
  const SpaceHight({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.02,
    );
  }
}
