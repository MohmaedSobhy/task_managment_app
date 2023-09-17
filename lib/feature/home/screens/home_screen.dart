import 'package:flutter/material.dart';
import 'package:task_managment_app/feature/home/view/admin_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AdminDrawer(),
      body: SafeArea(
        child: ListView(
          children: [],
        ),
      ),
    );
  }
}
