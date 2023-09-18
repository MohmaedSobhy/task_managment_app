import 'package:flutter/material.dart';
import 'package:task_managment_app/core/color/app_color.dart';
import 'package:task_managment_app/core/widgets/custome_header_date.dart';
import 'package:task_managment_app/feature/Admin%20Home/view/admin_drawer.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
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
        actions: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              decoration: BoxDecoration(
                color: AppColor.purble,
                borderRadius: BorderRadius.circular(10),
              ),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      drawer: const AdminDrawer(userName: "Mohamed Sobhy"),
    );
  }
}