import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:task_managment_app/core/widgets/text_form_field.dart';
import '../../../core/localization/app_string.dart';
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
          if (UpdateDepartmentCubit.get(context).name.text.isEmpty) {
            UpdateDepartmentCubit.get(context)
                .setDepartmentName(departmentName: "My Name");
          }
          if (UpdateDepartmentCubit.get(context).managers.isEmpty) {
            UpdateDepartmentCubit.get(context).loadAllManagers();
          }
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0.0,
              title: Text(
                AppString.updateDepartment,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 20,
                ),
              ),
              centerTitle: true,
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
                onPressed: () {
                  Get.back();
                },
              ),
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.sizeOf(context).width * 0.02,
                vertical: MediaQuery.sizeOf(context).height * 0.15,
              ),
              child: ListView(
                children: [
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.08,
                  ),
                  CustomeTextFormField(
                    controller: UpdateDepartmentCubit.get(context).name,
                    hint: AppString.updateDepartment,
                    textInputType: TextInputType.name,
                    readOnly: true,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
