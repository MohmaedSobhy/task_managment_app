import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'update_department_state.dart';

class UpdateDepartmentCubit extends Cubit<UpdateDepartmentState> {
  TextEditingController textEditingController = TextEditingController();

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  UpdateDepartmentCubit() : super(UpdateDepartmentInitial());

  //List<Manager> managers = [];

  bool loadAllManger = false;

  static UpdateDepartmentCubit get(context) {
    return BlocProvider.of(context);
  }

  void updateDepartment() {}
}
