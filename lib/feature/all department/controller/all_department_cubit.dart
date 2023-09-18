import 'package:bloc/bloc.dart';

import '../../../core/api/api.dart';
import '../../../core/api/end_points.dart';
import '../../../core/model/department.dart';

part 'all_department_state.dart';

class AllDepartmentCubit extends Cubit<AllDepartmentState> {
  List<Department> departments = [];
  AllDepartmentCubit() : super(AllDepartmentInitial());

  void loadAllDepartments() {
    API.getMethod(baseUrl: EndPoints.allDeparment).then((response) {
      //print(response.body);
    });
  }
}
