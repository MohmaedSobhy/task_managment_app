import 'package:flutter/material.dart';
import 'package:task_managment_app/core/widgets/custome_header_date.dart';
import 'package:task_managment_app/feature/Admin%20Home/view/admin_drawer.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(builder: (context) {
          return IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
            ),
          );
        }),
        title: const CustomeDate(date: "9/18/2023"),
        actions: [],
      ),
      drawer: const AdminDrawer(userName: "Mohamed Sobhy"),
    );
  }
}
