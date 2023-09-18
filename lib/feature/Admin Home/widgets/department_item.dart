import 'package:flutter/material.dart';
import 'package:task_managment_app/core/color/app_color.dart';
import 'package:task_managment_app/feature/Admin%20Home/widgets/employe_item.dart';

class DepartmentNameView extends StatelessWidget {
  const DepartmentNameView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.sizeOf(context).width * 0.01,
              ),
              child: Container(
                color: Colors.black,
                width: MediaQuery.sizeOf(context).width * 0.3,
                height: 2,
              ),
            ),
            const Text(
              "department name",
              style: TextStyle(
                color: AppColor.gray,
                fontSize: 18,
              ),
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.02,
            ),
            const Icon(
              Icons.edit,
              color: AppColor.gray,
            )
          ],
        ),
        GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 2,
            crossAxisSpacing: 3,
            childAspectRatio: 1.5 / 1,
          ),
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: 10,
          itemBuilder: (context, index) {
            return const EmployeeItem();
          },
        )
      ],
    );
  }
}
