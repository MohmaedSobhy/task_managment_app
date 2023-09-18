import 'package:flutter/material.dart';

class AllDepartmentView extends StatelessWidget {
  const AllDepartmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (_, index) {
        return const AllDepartmentView();
      },
    );
  }
}
