import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_managment_app/core/color/app_color.dart';
import 'package:task_managment_app/core/widgets/custome_header_date.dart';
import 'package:task_managment_app/feature/Admin%20Home/controller/admin_cubit.dart';
import 'package:task_managment_app/feature/Admin%20Home/controller/admin_state.dart';
import 'package:task_managment_app/feature/Admin%20Home/view/admin_drawer.dart';
import 'package:task_managment_app/feature/Admin%20Home/view/all_tasks.dart';
import 'package:task_managment_app/feature/Admin%20Home/widgets/department_item.dart';

import '../view/taped_bar_.dart';

class AdminHomeScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  AdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdminCubit, AdminState>(
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
          body: Column(
            children: [
              const CustomTabBar(),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.02,
              ),
              Visibility(
                visible: AdminCubit.get(context).isClosed == false,
                child: const Expanded(
                  child: DepartmentNameView(),
                ),
              ),
              Visibility(
                visible: AdminCubit.get(context).isClosed == true,
                child: const Expanded(
                  child: AllTaskViews(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
