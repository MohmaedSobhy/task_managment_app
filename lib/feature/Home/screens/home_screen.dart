import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_managment_app/feature/Home/widgets/task_item.dart';

import '../controller/home_cubit.dart';
import '../view/user_drawer.dart';
import '../widgets/custome_header_date.dart';

class HomeScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            key: _scaffoldKey,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0.0,
              leading: Builder(builder: (context) {
                return IconButton(
                  onPressed: () {
                    _scaffoldKey.currentState?.openDrawer();
                  },
                  icon: const Icon(
                    Icons.menu,
                    color: Colors.black,
                  ),
                );
              }),
              title: CustomeDate(
                date: HomeCubit.get(context).currentDate,
              ),
              actions: [],
            ),
            drawer: AdminDrawer(
              userName: HomeCubit.get(context).userName,
            ),
            backgroundColor: Colors.white,
            body: SafeArea(
              child: ListView(
                children: const [
                  TaskItem(state: "NEW"),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
