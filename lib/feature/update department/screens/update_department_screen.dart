import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/localization/app_string.dart';
import '../../../core/widgets/button.dart';
import '../../../core/widgets/header_txt.dart';
import '../../../core/widgets/text_form_field.dart';
import '../../update%20department/controller/update_department_cubit.dart';

class UpdateDepartmentScreen extends StatelessWidget {
  const UpdateDepartmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => UpdateDepartmentCubit(),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.sizeOf(context).width * 0.03),
            child: BlocConsumer<UpdateDepartmentCubit, UpdateDepartmentState>(
              listener: (context, state) {},
              builder: (context, state) {
                return Form(
                  key: UpdateDepartmentCubit.get(context).formkey,
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
                        controller: UpdateDepartmentCubit.get(context)
                            .textEditingController,
                        hint: AppString.name,
                        textInputType: TextInputType.text,
                        onValidate: (value) {
                          if (value.toString().isEmpty) {
                            return "Department Name";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.04,
                      ),
                      CustomeTextFormField(
                        controller: UpdateDepartmentCubit.get(context)
                            .textEditingController,
                        hint: AppString.name,
                        textInputType: TextInputType.text,
                        onValidate: (value) {
                          if (value.toString().isEmpty) {
                            return "Assgin Manager";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.04,
                      ),
                      CustomButton(
                        onTap: () {
                          if (UpdateDepartmentCubit.get(context)
                              .formkey
                              .currentState!
                              .validate()) {
                            UpdateDepartmentCubit.get(context)
                                .updateDepartment();
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
