import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:synchronized/synchronized.dart';
import 'package:task_managment_app/core/model/department.dart';
import 'add_task_state.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  static final Lock _lock = Lock();
  static AddTaskCubit? _taskCubit;
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController employee = TextEditingController();
  TextEditingController department = TextEditingController();
  TextEditingController startDate = TextEditingController();
  TextEditingController endDate = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  List<Department> allDepartments = [];

  AddTaskCubit() : super(AddTaskInitial());

  static AddTaskCubit get(context) {
    if (_taskCubit == null) {
      _lock.synchronized(() {
        _taskCubit ??= BlocProvider.of(context);
      });
    }
    return _taskCubit!;
  }
}
