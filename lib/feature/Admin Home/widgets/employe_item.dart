import 'package:flutter/material.dart';
import 'package:task_managment_app/core/color/app_color.dart';
import 'package:task_managment_app/feature/Admin%20Home/widgets/text_icon.dart';

class EmployeeItem extends StatelessWidget {
  const EmployeeItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Container(
        padding: EdgeInsets.all(8),
        child: Row(
          children: [
            Container(
              width: 2,
              color: AppColor.purble,
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Employe Name",
                    style: TextStyle(
                      color: AppColor.darkColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.01,
                  ),
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: AppColor.purble.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Text(
                      "ADMIN",
                      style: TextStyle(
                        color: AppColor.purble,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  const CustomTextIcon(
                    icon: Icons.email,
                    txt: "Email",
                    txtColor: AppColor.darkColor,
                    size: 15,
                  ),
                  const CustomTextIcon(
                    icon: Icons.phone,
                    txt: "Phone",
                    txtColor: AppColor.darkColor,
                    size: 25,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
