import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:task_managment_app/core/model/department.dart';
import 'package:task_managment_app/core/widgets/button.dart';
import 'package:task_managment_app/core/widgets/circle_loading_indicator.dart';
import 'package:task_managment_app/core/widgets/text_form_field.dart';
import '../../../core/localization/app_string.dart';
import '../../../core/widgets/drop_down_list.dart';
import '../controller/update_department_cubit.dart';

class UpdateDepartmentScreen extends StatelessWidget {
  final Department department;
  const UpdateDepartmentScreen({super.key, required this.department});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdateDepartmentCubit(),
      child: Scaffold(
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
        body: BlocConsumer<UpdateDepartmentCubit, UpdateDepartmentState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (UpdateDepartmentCubit.get(context).name.text.isEmpty) {
              UpdateDepartmentCubit.get(context)
                  .setDepartmentName(departmentName: department.name);

              return const CircleLoading();
            }
            if (UpdateDepartmentCubit.get(context).managers.isEmpty) {
              UpdateDepartmentCubit.get(context).loadAllManagers();
              return const CircleLoading();
            }
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.sizeOf(context).width * 0.02,
                vertical: MediaQuery.sizeOf(context).height * 0.15,
              ),
              child: Form(
                key: UpdateDepartmentCubit.get(context).formkey,
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
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.03,
                    ),
                    DropDownItems(
                      label: AppString.managers,
                      options: UpdateDepartmentCubit.get(context).managers,
                      onChange: (value) {
                        UpdateDepartmentCubit.get(context).selcectValue =
                            value as String;
                      },
                      validator: (value) {
                        if (value.toString().isEmpty) {
                          return "Select Value";
                        }
                        return null;
                      },
                      selectedItem:
                          UpdateDepartmentCubit.get(context).managers[0],
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.03,
                    ),
                    CustomButton(
                      onTap: () {
                        if (UpdateDepartmentCubit.get(context)
                            .formkey
                            .currentState!
                            .validate()) {
                          UpdateDepartmentCubit.get(context)
                              .updateDepartment(id: department.id);
                        }
                      },
                      title: AppString.update,
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
