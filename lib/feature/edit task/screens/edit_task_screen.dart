import 'package:flutter/material.dart';
import 'package:task_managment_app/core/color/app_color.dart';
import 'package:task_managment_app/core/widgets/custom_appBar.dart';
import 'package:task_managment_app/core/widgets/radio_item.dart';
import 'package:task_managment_app/feature/edit%20task/view/description_task_view.dart';
import 'package:task_managment_app/feature/edit%20task/view/hight_space.dart';
import 'package:task_managment_app/feature/edit%20task/view/pick_add_image.dart';
import 'package:task_managment_app/feature/edit%20task/view/view_all_task_state.dart';

class EditTaskScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  EditTaskScreen({super.key});
  final String value = "hello";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: PreferredSize(
          preferredSize: Size(
            double.infinity,
            MediaQuery.sizeOf(context).height * 0.10,
          ),
          child: Builder(builder: (context) {
            return CustomAppBar(onTap: () {
              _scaffoldKey.currentState?.openDrawer();
            });
          })),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: const [
            Text(
              "Create a High-Intensity Interval Training (HIIt) Workout Routing",
              style: TextStyle(
                color: AppColor.darkColor,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "tap to eidt",
              style: TextStyle(
                color: AppColor.gray,
              ),
            ),
            SpaceHight(),
            SpaceHight(),
            PickImage(),
            SpaceHight(),
            ViewAllStateTask(),
            SpaceHight(),
            DescriptionTaskView(),
          ],
        ),
      ),
    );
  }
}
