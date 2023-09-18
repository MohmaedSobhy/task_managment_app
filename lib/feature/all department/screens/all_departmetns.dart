import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../../core/localization/app_string.dart';
import '../../../core/route/route_name.dart';
import '../../all%20department/controller/all_department_cubit.dart';
import '../widget/department_item.dart';

class AllDepartmentScreen extends StatelessWidget {
  const AllDepartmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AllDepartmentCubit(),
      child: BlocConsumer<AllDepartmentCubit, AllDepartmentState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (AllDepartmentCubit.get(context).departments.isEmpty) {
            AllDepartmentCubit.get(context).loadAllDepartments();
          }
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
                onPressed: () {
                  Get.back();
                },
              ),
              backgroundColor: Colors.white,
              centerTitle: true,
              elevation: 0.0,
              title: Text(
                AppString.allDepartment,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 20,
                ),
              ),
            ),
            body: ListView.builder(
              itemCount: AllDepartmentCubit.get(context).departments.length,
              itemBuilder: (_, index) {
                return CardDepartmentItem(
                  department:
                      AllDepartmentCubit.get(context).departments[index],
                  onTap: () {
                    //print(RouteName.updateDepartment);
                    Get.offNamed(
                      RouteName.updateDepartment,
                      arguments:
                          AllDepartmentCubit.get(context).departments[index],
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
