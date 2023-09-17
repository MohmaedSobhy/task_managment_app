import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_managment_app/feature/home/controller/home_cubit.dart';
import 'package:task_managment_app/feature/home/view/admin_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (HomeCubit.get(context).userName.isEmpty) {
            HomeCubit.get(context).getUserName();
          }
          return Scaffold(
            appBar: AppBar(),
            drawer: AdminDrawer(
              userName: HomeCubit.get(context).userName,
            ),
            body: SafeArea(
              child: ListView(
                children: [],
              ),
            ),
          );
        },
      ),
    );
  }
}
