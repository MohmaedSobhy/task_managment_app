import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:synchronized/synchronized.dart';
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

  void loadAllDepartments() {
    API.getMethod(baseUrl: EndPoints.allDeparment).then((response) {
      print(response.body);
    });
  }
}
