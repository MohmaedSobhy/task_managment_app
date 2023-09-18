import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../all%20department/controller/all_department_cubit.dart';

class AllDepartmentScreen extends StatelessWidget {
  const AllDepartmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AllDepartmentCubit(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
