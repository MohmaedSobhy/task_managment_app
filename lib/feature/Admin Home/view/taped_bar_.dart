import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Admin%20Home/controller/admin_cubit.dart';
import '../../Admin%20Home/controller/admin_state.dart';
import '../../Admin%20Home/widgets/tap_icon.dart';

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
              color: AdminCubit.get(context).usersTabColor,
              txt: "Users",
              icon: Icons.person,
              onTap: () {
                AdminCubit.get(context).changeTabView();
              },
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.05,
            ),
            TapedIcon(
              color: AdminCubit.get(context).tasksTabColor,
              txt: "Task",
              icon: Icons.book,
              onTap: () {
                AdminCubit.get(context).changeTabView();
              },
            ),
          ],
        );
      },
    );
  }
}
