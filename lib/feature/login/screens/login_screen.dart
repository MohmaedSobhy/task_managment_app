import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:task_managment_app/core/helper/show_snake_bar.dart';
import '../../../core/color/app_color.dart';
import '../../../core/localization/app_string.dart';
import '../../../core/widgets/button.dart';
import '../../../core/widgets/text_form_field.dart';
import '../controller/cubit/login_cubit_cubit.dart';
import '../widgets/check_box.dart';

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
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.15,
                      ),
                      Text(
                        AppString.welcome,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.02,
                      ),
                      const Text(
                        AppString.loginTxt,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          color: AppColor.gray,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.03,
                      ),
                      CustomeTextFormField(
                        controller: LoginCubit.get(context).emailController,
                        hint: AppString.email,
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
