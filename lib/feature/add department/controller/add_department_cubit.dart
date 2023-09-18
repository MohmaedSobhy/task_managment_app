import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/api/api.dart';
import '../../../core/api/api_keys.dart';
import '../../../core/api/end_points.dart';
import '../../../core/shared/shared_date.dart';

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
    APIManager.postMethod(
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
