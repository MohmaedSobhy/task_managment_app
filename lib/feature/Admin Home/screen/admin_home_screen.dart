import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/widgets/custome_header_date.dart';
import '../../Admin%20Home/controller/admin_cubit.dart';
import '../../Admin%20Home/controller/admin_state.dart';
import '../../Admin%20Home/view/admin_drawer.dart';
import '../../Admin%20Home/view/all_tasks.dart';
import '../../Admin%20Home/widgets/department_item.dart';
import '../view/taped_bar_.dart';

class AdminHomeScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  AdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdminCubit, AdminState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          key: _scaffoldKey,
          appBar: PreferredSize(
            preferredSize: Size(
              double.infinity,
              MediaQuery.sizeOf(context).height * 0.08,
            ),
            child: AppBar(
              backgroundColor: Colors.white,
              elevation: 0.0,
              leading: Builder(builder: (context) {
                return IconButton(
                  onPressed: () {
                    _scaffoldKey.currentState?.openDrawer();
                  },
                  icon: const Icon(
                    Icons.menu,
                    color: Colors.black,
                  ),
                );
              }),
              title: const CustomeDate(date: "9/18/2023"),
            ),
          ),
          backgroundColor: Colors.white,
          drawer: const AdminDrawer(userName: "Mohamed Sobhy"),
          body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.sizeOf(context).width * 0.03,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.02,
                ),
                const CustomTabBar(),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.02,
                ),
                Visibility(
                  visible: AdminCubit.get(context).isFirstView == false,
                  child: const Expanded(
                    child: DepartmentNameView(),
                  ),
                ),
                Visibility(
                  visible: AdminCubit.get(context).isFirstView == true,
                  child: const Expanded(
                    child: AllTaskViews(),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
