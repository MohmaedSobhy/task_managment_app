import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:synchronized/synchronized.dart';
import 'package:task_managment_app/core/api/api.dart';
import 'package:task_managment_app/core/api/api_keys.dart';
import 'package:task_managment_app/core/api/end_points.dart';
import 'package:task_managment_app/core/shared/shared_date.dart';
import 'add_task_state.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  static final Lock _lock = Lock();
  static AddTaskCubit? _taskCubit;
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  List<String> allEmployees = [];
  String currentEmployee = "";
  DateRangePickerSelectionChangedArgs dateTime =
      const DateRangePickerSelectionChangedArgs(null);

  AddTaskCubit() : super(AddTaskInitial());

  static AddTaskCubit get(context) {
    if (_taskCubit == null) {
      _lock.synchronized(() {
        _taskCubit ??= BlocProvider.of(context);
      });
    }
    return _taskCubit!;
  }

  void loadAllEmployee() async {
    String token = "";

    await StorageHelper.getValue(key: APIKey.token).then((value) {
      token = value;
    });

    APIManager.getMethod(baseUrl: EndPoints.showallEmployee, token: token)
        .then((response) {
      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        String value = '';
        for (dynamic item in json['data']) {
          value = "${item[APIKey.id]}-" + item[APIKey.name];
          allEmployees.add(value);
        }
        currentEmployee = allEmployees[0];
        emit(LoadAllData());
      }
    }).catchError((error) {});
  }

  void addTask() async {
    String token = "";
    await StorageHelper.getValue(key: APIKey.token).then((value) {
      token = value;
    });
    String employeeId = _getEmployeeId().toString();
    APIManager.postMethod(
            baseUrl: EndPoints.addTask,
            body: {
              APIKey.name: title.text.toString(),
              APIKey.employeeId: employeeId,
              APIKey.description: description.text.toString(),
              APIKey.status: '0',
              APIKey.startDate: getDateFormated(dateTime.value.startDate),
              APIKey.endDate: getDateFormated(dateTime.value.endDate)
            },
            token: token)
        .then((response) {
      print(response.body);

      if (response.statusCode == 200) {
        _clearFileds();
        print("Hello");
        emit(AddTaskSuccefully());
      }
    }).catchError((error) {
      print(error);
    });
  }

  int _getEmployeeId() {
    int index = currentEmployee.indexOf('-');
    String id = currentEmployee.substring(0, index);
    return int.parse(id);
  }

  void _clearFileds() {
    title.text = "";
    description.text = "";
    dateTime.value.startDate = DateTime.now();
    dateTime.value.endDate = null;
  }

  String getDateFormated(DateTime date) {
    print(DateFormat('yyyy/MM/d').format(date));
    return DateFormat('yyyy/MM/d').format(date);
  }
}
