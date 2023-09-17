import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:task_managment_app/core/helper/show_snake_bar.dart';
import 'package:task_managment_app/core/localization/app_string.dart';
import 'package:task_managment_app/core/widgets/button.dart';
import 'package:task_managment_app/core/widgets/header_txt.dart';
import 'package:task_managment_app/core/widgets/text_form_field.dart';
import 'package:task_managment_app/feature/add%20department/controller/add_department_cubit.dart';

class AddDepartmentScreen extends StatelessWidget {
  const AddDepartmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => AddDepartmentCubit(),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.sizeOf(context).width * 0.03),
            child: BlocConsumer<AddDepartmentCubit, AddDepartmentState>(
              listener: (context, state) {
                if (state is FailedAddDepartment) {
                  SnakeBarHelper.showSnakeBar(
                    title: "Network",
                    message: AppString.networkFailed,
                    backGround: Colors.red,
                  );
                }
                if (state is ErrorAddDepartment) {
                  SnakeBarHelper.showSnakeBar(
                      title: "Message",
                      message: AppString.departmentExist,
                      backGround: Colors.red);
                }
                if (state is SucceedAddDepartment) {
                  Get.back();
                  SnakeBarHelper.showSnakeBar(
                    title: "Succeed",
                    message: AppString.addDepartmentSucceed,
                  );
                }
              },
              builder: (context, state) {
                return Form(
                  key: AddDepartmentCubit.get(context).formkey,
                  child: ListView(
                    children: [
                      const HeaderText(
                        decription: AppString.addDepartmentDescription,
                        title: AppString.addDepartment,
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.04,
                      ),
                      CustomeTextFormField(
                        controller: AddDepartmentCubit.get(context)
                            .textEditingController,
                        hint: AppString.name,
                        textInputType: TextInputType.text,
                        onValidate: (value) {
                          if (value.toString().isEmpty) {
                            return "Enter Department Name";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.04,
                      ),
                      CustomButton(
                        onTap: () {
                          if (AddDepartmentCubit.get(context)
                              .formkey
                              .currentState!
                              .validate()) {
                            AddDepartmentCubit.get(context).addDepartment();
                          }
                        },
                        title: AppString.create,
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
