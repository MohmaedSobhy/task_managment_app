import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/home_cubit.dart';
import '../view/user_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is HomeInitial) {
            HomeCubit.get(context).initialData();
            HomeCubit.get(context).printObject();
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
