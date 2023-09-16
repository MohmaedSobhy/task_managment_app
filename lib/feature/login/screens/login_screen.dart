import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:task_managment_app/core/localization/app_string.dart';
import 'package:task_managment_app/core/widgets/button.dart';
import 'package:task_managment_app/core/widgets/header_txt.dart';
import 'package:task_managment_app/core/widgets/text_form_field.dart';
import 'package:task_managment_app/feature/login/controller/login_cubit_cubit.dart';
import 'package:task_managment_app/feature/login/widgets/check_box.dart';

import '../../../core/helper/show_snake_bar.dart';
import '../controller/login_cubit_state.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => LoginCubit(),
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginSucceed) {
              Get.toNamed("");
              SnakeBarHelper.showSnakeBar(
                title: "Login",
                message: AppString.loginSuccess,
              );
            }
          },
          builder: (context, state) {
            return Form(
              key: LoginCubit.get(context).formkey,
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.sizeOf(context).width * 0.03,
                  ),
                  child: ListView(
                    children: [
                      const HeaderText(
                        decription: AppString.loginTxt,
                        title: AppString.welcome,
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.03,
                      ),
                      CustomeTextFormField(
                        controller: LoginCubit.get(context).emailController,
                        hint: AppString.email,
                        textInputType: TextInputType.emailAddress,
                        onValidate: (value) {
                          if (value.toString().isEmpty) {
                            return AppString.enterEmail;
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.02,
                      ),
                      CustomeTextFormField(
                        controller: LoginCubit.get(context).passwordController,
                        hint: AppString.password,
                        textInputType: TextInputType.visiblePassword,
                        onValidate: (value) {
                          if (value.toString().isEmpty) {
                            return AppString.password;
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.03,
                      ),
                      CustomCheckBox(
                        value: LoginCubit.get(context).checkBoxValue,
                        onChange: (value) {
                          LoginCubit.get(context).checkBoxState();
                        },
                        title: AppString.keepMeLogged,
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.03,
                      ),
                      CustomButton(
                        onTap: () {
                          if (LoginCubit.get(context)
                              .formkey
                              .currentState!
                              .validate()) {
                            LoginCubit.get(context).userLogin();
                          }
                        },
                        title: AppString.login,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
