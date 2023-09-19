import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_managment_app/core/helper/show_toast_message.dart';
import 'package:task_managment_app/core/widgets/button.dart';
import 'package:task_managment_app/core/widgets/drop_down_list.dart';
import 'package:task_managment_app/core/widgets/header_txt.dart';
import 'package:task_managment_app/core/widgets/text_form_field.dart';
import 'package:task_managment_app/feature/add%20task/controllers/add_task_cubit.dart';
import 'package:task_managment_app/feature/add%20task/controllers/add_task_state.dart';
import 'package:task_managment_app/feature/add%20task/views/date_picker.dart';
import '../../../core/localization/app_string.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddTaskCubit(),
      child: BlocConsumer<AddTaskCubit, AddTaskState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (AddTaskCubit.get(context).allEmployees.isEmpty) {
            AddTaskCubit.get(context).loadAllEmployee();
          }
          return SafeArea(
            child: Scaffold(
              body: Form(
                key: AddTaskCubit.get(context).formkey,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.sizeOf(context).width * 0.02,
                  ),
                  child: ListView(
                    children: [
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.01,
                      ),
                      const HeaderText(
                        decription: AppString.addTaskDecription,
                        title: AppString.addTask,
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.02,
                      ),
                      ShowTimeDatePicker(
                        onChanged: (data) {
                          AddTaskCubit.get(context).dateTime = data;
                          //  print(data.value.startDate);
                        },
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.02,
                      ),
                      CustomeTextFormField(
                        controller: AddTaskCubit.get(context).title,
                        hint: AppString.title,
                        textInputType: TextInputType.text,
                        onValidate: (value) {
                          if (value.toString().isEmpty) {
                            return "Enter Title";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.02,
                      ),
                      CustomeTextFormField(
                        controller: AddTaskCubit.get(context).description,
                        hint: AppString.description,
                        textInputType: TextInputType.text,
                        maxLines: 5,
                        onValidate: (value) {
                          if (value.toString().isEmpty) {
                            return "Enter Description";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.02,
                      ),
                      DropDownItems(
                        label: "Employee",
                        options: AddTaskCubit.get(context).allEmployees,
                        selectedItem: AddTaskCubit.get(context).currentEmployee,
                        validator: (value) {
                          if (value.toString().isEmpty) {
                            return "Should Assign Employee";
                          }
                          return null;
                        },
                        onChange: (value) {
                          AddTaskCubit.get(context).currentEmployee = value;
                        },
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.02,
                      ),
                      CustomButton(
                        onTap: () {
                          if (AddTaskCubit.get(context)
                                  .dateTime
                                  .value
                                  .endDate ==
                              null) {
                            ShowToast.showMessage(
                              message: AppString.selectEndDate,
                              color: Colors.red,
                            );
                          } else if (AddTaskCubit.get(context)
                              .formkey
                              .currentState!
                              .validate()) {
                            AddTaskCubit.get(context).addTask();
                          }
                        },
                        title: AppString.create,
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
