import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_managment_app/core/widgets/circle_precent_indicator.dart';

import '../../../core/widgets/custome_header_date.dart';

import '../controller/user_home_cubit.dart';
import '../controller/user_home_state.dart';
import '../view/user_drawer.dart';
import '../widgets/task_item.dart';

class UserHomeScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  UserHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserHomeCubit(),
      child: BlocConsumer<UserHomeCubit, UserHomeState>(
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
                date: UserHomeCubit.get(context).currentDate,
              ),
              actions: [
                CircleIndicator(
                  color: Colors.green,
                  text: "9/20",
                  backGroud: Colors.green.shade100,
                ),
                CircleIndicator(
                  color: Colors.orange,
                  text: "4/20",
                  backGroud: Colors.orange.shade100,
                ),
                CircleIndicator(
                  color: Colors.red,
                  text: "3/20",
                  backGroud: Colors.red.shade100,
                ),
              ],
            ),
            drawer: UserDrawer(
              userName: UserHomeCubit.get(context).userName,
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
