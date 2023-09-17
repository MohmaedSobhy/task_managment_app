import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_managment_app/core/api/api.dart';
import 'package:task_managment_app/core/api/api_keys.dart';
import 'package:task_managment_app/core/api/end_points.dart';
import 'package:task_managment_app/core/shared/shared_date.dart';
part 'add_department_state.dart';

class AddDepartmentCubit extends Cubit<AddDepartmentState> {
  TextEditingController textEditingController = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  AddDepartmentCubit() : super(AddDepartmentInitial());

  static AddDepartmentCubit get(context) {
    return BlocProvider.of(context);
  }

  void addDepartment() async {
    String token = await StorageHelper.getValue(key: APIKey.token);
    API
        .postMethod(
            baseUrl: EndPoints.addDepartment,
            body: {
              APIKey.name: textEditingController.text.toString(),
            },
            token: token)
        .then((response) {
      _checkMessage(json: jsonDecode(response.body));
    }).catchError((error) {
      emit(FailedAddDepartment());
    });
  }

  void _checkMessage({required Map<String, dynamic> json}) {
    if (json[APIKey.status]) {
      _clearTextField();
      emit(SucceedAddDepartment());
    } else {
      emit(ErrorAddDepartment());
    }
  }

  void _clearTextField() {
    textEditingController.text = "";
  }
}
