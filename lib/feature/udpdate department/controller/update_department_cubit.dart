import 'dart:html';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:synchronized/synchronized.dart';
import 'package:task_managment_app/core/api/api_keys.dart';
import 'package:task_managment_app/core/api/end_points.dart';
import 'package:task_managment_app/core/model/manager.dart';
import 'package:task_managment_app/core/shared/shared_date.dart';

import '../../../core/api/api.dart';
part 'update_department_state.dart';

class UpdateDepartmentCubit extends Cubit<UpdateDepartmentState> {
  static UpdateDepartmentCubit? _updateDepartment;
  static final _lock = Lock();
  List<Manager> managers = [];
  UpdateDepartmentCubit() : super(UpdateDepartmentInitial());

  static UpdateDepartmentCubit get(context) {
    if (_updateDepartment == null) {
      _lock.synchronized(() {
        _updateDepartment = BlocProvider.of(context);
      });
    }
    return _updateDepartment!;
  }

  void loadAllManagers() async {
    String token = "";
    await StorageHelper.getValue(key: APIKey.token).then((value) {
      token = value;
    });
    API
        .getMethod(baseUrl: EndPoints.allManagers, token: token)
        .then((response) {
      print(response.body);
    });
  }
}
