import 'dart:convert';
import 'dart:html';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:synchronized/synchronized.dart';
import '../../../core/api/api_keys.dart';
import '../../../core/api/end_points.dart';
import '../../../core/model/manager.dart';
import '../../../core/shared/shared_date.dart';
import '../../../core/api/api.dart';
part 'update_department_state.dart';

class UpdateDepartmentCubit extends Cubit<UpdateDepartmentState> {
  static UpdateDepartmentCubit? _updateDepartment;
  static final _lock = Lock();
  List<Manager> managers = [];
  String selcectValue = '';
  List<String> managersNames = [];
  TextEditingController name = TextEditingController();
  UpdateDepartmentCubit() : super(UpdateDepartmentInitial());

  static UpdateDepartmentCubit get(context) {
    if (_updateDepartment == null) {
      _lock.synchronized(() {
        _updateDepartment = BlocProvider.of(context);
      });
    }
    return _updateDepartment!;
  }

  void setDepartmentName({required String departmentName}) {
    name.text = departmentName;
    emit(UpdateDepartmentInitial());
  }

  void loadAllManagers() async {
    String token = "";
    await StorageHelper.getValue(key: APIKey.token).then((value) {
      token = value;
    });

    APIManager.getMethod(
      baseUrl: EndPoints.allManagers,
      token: token,
    ).then((response) {
      Map<String, dynamic> json = jsonDecode(response.body);
      for (dynamic item in json['data']) {
        managers.add(Manager.fromJson(item));
        managersNames.add(item[APIKey.name]);
      }
      selcectValue = managersNames[0];
    });
  }

  void updateDepartment({required int id}) async {
    String token = "";
    await StorageHelper.getValue(key: APIKey.token).then((value) {
      token = value;
    });

    APIManager.postMethod(
            baseUrl: "${EndPoints.updateDepartment}$id",
            body: {
              APIKey.name: name.text.toString(),
              APIKey.managerId: (1).toString(),
            },
            token: token)
        .then((response) {
      print(response.body);
    }).catchError((error) {});
  }

  int _getManagerId() {
    return 0;
  }
}
