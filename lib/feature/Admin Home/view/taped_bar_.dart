import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_managment_app/feature/Admin%20Home/controller/admin_cubit.dart';
import 'package:task_managment_app/feature/Admin%20Home/controller/admin_state.dart';
import 'package:task_managment_app/feature/Admin%20Home/widgets/tap_icon.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdminCubit, AdminState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Row(
          children: [
            TapedIcon(
              color: Colors.black,
              txt: "Users",
              icon: Icons.person,
              onTap: () {
                print("hello");
                AdminCubit.get(context).changeTabView();
              },
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.01,
            ),
          ],
        );
      },
    );
  }
}
