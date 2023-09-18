import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:synchronized/synchronized.dart';
import 'package:task_managment_app/core/helper/show_toast_message.dart';
import '../../../core/api/api_keys.dart';
import '../../../core/api/end_points.dart';
import '../../../core/shared/shared_date.dart';
import '../../../core/api/api.dart';
part 'update_department_state.dart';

class UpdateDepartmentCubit extends Cubit<UpdateDepartmentState> {
  static UpdateDepartmentCubit? _updateDepartment;
  static final _lock = Lock();
  List<String> managers = [];
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  String selcectValue = '';
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
      String value = '';
      for (dynamic item in json['data']) {
        // ignore: prefer_interpolation_to_compose_strings
        value = "${item[APIKey.id]}-" + item[APIKey.name];

        managers.add(value);
      }
      emit(LoadAllManagerSuccess());
    }).catchError((error) {
      print(error);
    });
  }

  void updateDepartment({required int id}) async {
    String token = "";
    await StorageHelper.getValue(key: APIKey.token).then((value) {
      token = value;
    });
    int managerId = _getManagerId();
    APIManager.postMethod(
      baseUrl: "${EndPoints.updateDepartment}$id",
      body: {
        'name': name.text.toString(),
        'manager_id': '$managerId',
      },
      token: token,
    ).then((response) {
      if (response.statusCode == 200) {
        ShowToast.showMessage(
          message: "Department Update Succeed",
          color: Colors.green,
        );
      } else {
        ShowToast.showMessage(
          message: "You can choose only user with type of Manager",
          color: Colors.red,
        );
      }
    }).catchError((error) {});
  }

  int _getManagerId() {
    int index = selcectValue.indexOf('-');
    String id = selcectValue.substring(0, index);
    return int.parse(id);
  }
}
