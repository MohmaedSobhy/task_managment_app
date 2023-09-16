import 'package:flutter/material.dart';
import 'package:task_managment_app/core/localization/app_string.dart';
import 'package:task_managment_app/core/widgets/button.dart';
import 'package:task_managment_app/core/widgets/header_txt.dart';
import 'package:task_managment_app/core/widgets/text_form_field.dart';

class AddNewDepartmentScreen extends StatelessWidget {
  const AddNewDepartmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            const HeaderText(
              decription: AppString.addDepartmentDescription,
              title: AppString.addDepartment,
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.02,
            ),
            CustomeTextFormField(
              controller: TextEditingController(),
              hint: AppString.name,
              textInputType: TextInputType.text,
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
    );
  }
}
