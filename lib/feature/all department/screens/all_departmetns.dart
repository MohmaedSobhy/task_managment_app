import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_managment_app/core/localization/app_string.dart';

import '../../all%20department/controller/all_department_cubit.dart';
import '../widget/department_item.dart';

class AllDepartmentScreen extends StatelessWidget {
  const AllDepartmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AllDepartmentCubit(),
      child: BlocConsumer<AllDepartmentCubit, AllDepartmentState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              centerTitle: true,
              title: Text(
                AppString.allDepartment,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 15,
                ),
              ),
            ),
            body: ListView.builder(
              itemCount: AllDepartmentCubit.get(context).departments.length,
              itemBuilder: (_, index) {
                return CardDepartmentItem(
                  department:
                      AllDepartmentCubit.get(context).departments[index],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
