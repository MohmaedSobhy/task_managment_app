import 'package:bloc/bloc.dart';
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
    API
        .getMethod(baseUrl: EndPoints.allManagers, token: token)
        .then((response) {
      print(response.body.toString());
    });
  }
}
