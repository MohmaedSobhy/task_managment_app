import 'package:flutter/material.dart';
import 'package:task_managment_app/core/localization/app_string.dart';
import 'package:task_managment_app/core/widgets/button.dart';
import 'package:task_managment_app/core/widgets/header_txt.dart';
import 'package:task_managment_app/core/widgets/text_form_field.dart';

class AddUserScreen extends StatelessWidget {
  const AddUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.sizeOf(context).width * 0.03,
          ),
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
                controller: TextEditingController(),
                hint: AppString.name,
                textInputType: TextInputType.name,
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.02,
              ),
              CustomeTextFormField(
                controller: TextEditingController(),
                hint: AppString.email,
                textInputType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.02,
              ),
              CustomeTextFormField(
                controller: TextEditingController(),
                hint: AppString.phone,
                textInputType: TextInputType.phone,
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.02,
              ),
              CustomeTextFormField(
                controller: TextEditingController(),
                hint: AppString.password,
                textInputType: TextInputType.visiblePassword,
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.02,
              ),
              CustomButton(
                onTap: () {},
                title: AppString.create,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
