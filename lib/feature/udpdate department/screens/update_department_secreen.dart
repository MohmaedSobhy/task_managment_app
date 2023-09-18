import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_managment_app/core/localization/app_string.dart';

import '../controller/update_department_cubit.dart';

class UpdateDepartmentScreen extends StatelessWidget {
  const UpdateDepartmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdateDepartmentCubit(),
      child: BlocConsumer<UpdateDepartmentCubit, UpdateDepartmentState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.white,
              title: Text(
                AppString.updateDepartment,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 20,
                ),
              ),
            ),
            body: ListView(
              children: [],
            ),
          );
        },
      ),
    );
  }
}
