import 'package:flutter/material.dart';
import 'package:task_managment_app/core/widgets/task_item.dart';

class AllTaskViews extends StatelessWidget {
  const AllTaskViews({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (_, index) {
        return const TaskItem(
          state: "NEW",
        );
      },
    );
  }
}
