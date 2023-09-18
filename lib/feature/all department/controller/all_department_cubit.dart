import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:synchronized/synchronized.dart';
import '../../../core/api/api_keys.dart';
import '../../../core/shared/shared_date.dart';
import '../../../core/api/api.dart';
import '../../../core/api/end_points.dart';
import '../../../core/model/department.dart';

part 'all_department_state.dart';

class AllDepartmentCubit extends Cubit<AllDepartmentState> {
  List<Department> departments = [];
  AllDepartmentCubit() : super(AllDepartmentInitial());
  static AllDepartmentCubit? _departmentCubit;
  static final _lock = Lock();
  static AllDepartmentCubit get(context) {
    if (_departmentCubit == null) {
      _lock.synchronized(() {
        _departmentCubit = BlocProvider.of(context);
      });
    }
    return _departmentCubit!;
  }

  void loadAllDepartments() async {
    String token = " ";
    await StorageHelper.getValue(key: APIKey.token).then((value) {
      token = value;
    });
    await APIManager.getMethod(baseUrl: EndPoints.allDeparment, token: token)
        .then((response) {
      Map<String, dynamic> json = jsonDecode(response.body);
      for (var item in json['data']) {
        departments.add(Department.fromJson(data: item));
      }
      emit(AllDepartmentLoadSucceed());
    });
  }
}
