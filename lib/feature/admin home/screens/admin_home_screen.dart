import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/home_cubit.dart';
import '../view/admin_drawer.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({super.key});

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
