import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_managment_app/core/widgets/button.dart';
import 'package:task_managment_app/core/widgets/header_txt.dart';
import 'package:task_managment_app/core/widgets/text_form_field.dart';
import 'package:task_managment_app/feature/add%20task/controllers/add_task_cubit.dart';
import 'package:task_managment_app/feature/add%20task/controllers/add_task_state.dart';
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
          return SafeArea(
            child: Scaffold(
              body: Form(
                key: AddTaskCubit.get(context).formkey,
                child: ListView(
                  children: [
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.08,
                    ),
                    const HeaderText(
                      decription: AppString.addTaskDecription,
                      title: AppString.addTask,
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
                    CustomButton(
                      onTap: () {},
                      title: AppString.create,
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
