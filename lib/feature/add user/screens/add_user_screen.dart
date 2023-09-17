import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_managment_app/core/localization/app_string.dart';
import 'package:task_managment_app/core/widgets/button.dart';
import 'package:task_managment_app/core/widgets/header_txt.dart';
import 'package:task_managment_app/core/widgets/text_form_field.dart';
import 'package:task_managment_app/feature/add%20user/controller/add_user_cubit.dart';
import 'package:task_managment_app/feature/add%20user/view/radio_groub.dart';

class AddUserScreen extends StatelessWidget {
  const AddUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => AddUserCubit(),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.sizeOf(context).width * 0.03,
            ),
            child: BlocConsumer<AddUserCubit, AddUserState>(
              listener: (context, state) {},
              builder: (context, state) {
                return Form(
                  key: AddUserCubit.get(context).formkey,
                  child: ListView(
                    children: [
                      const HeaderText(
                        decription: AppString.addUserDescription,
                        title: AppString.addUser,
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.02,
                      ),
                      CustomeTextFormField(
                        controller: AddUserCubit.get(context).name,
                        hint: AppString.name,
                        textInputType: TextInputType.name,
                        onValidate: (value) {
                          if (value.toString().isEmpty) {
                            return "Enter Name";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.02,
                      ),
                      CustomeTextFormField(
                        controller: AddUserCubit.get(context).email,
                        hint: AppString.email,
                        textInputType: TextInputType.emailAddress,
                        onValidate: (value) {
                          if (value.toString().isEmpty) {
                            return "Enter Email";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.02,
                      ),
                      CustomeTextFormField(
                        controller: AddUserCubit.get(context).phone,
                        hint: AppString.phone,
                        textInputType: TextInputType.phone,
                        onValidate: (value) {
                          if (value.toString().isEmpty) {
                            return "Enter phone";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.02,
                      ),
                      CustomeTextFormField(
                        controller: AddUserCubit.get(context).password,
                        hint: AppString.password,
                        textInputType: TextInputType.visiblePassword,
                        onValidate: (value) {
                          if (value.toString().isEmpty) {
                            return "Enter password";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.02,
                      ),
                      CustomeRadioGroup(
                        query: AddUserCubit.get(context).user,
                        choises: AppString.users,
                        onChange: (value) {
                          AddUserCubit.get(context)
                              .onChangeRadio(choise: value);
                        },
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.02,
                      ),
                      CustomButton(
                        onTap: () {
                          AddUserCubit.get(context).addUser();
                        },
                        title: AppString.create,
                      ),
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
