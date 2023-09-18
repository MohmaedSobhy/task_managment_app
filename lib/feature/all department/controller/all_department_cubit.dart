import 'package:bloc/bloc.dart';
import 'package:http/http.dart';
import 'package:task_managment_app/core/api/api.dart';
import 'package:task_managment_app/core/api/end_points.dart';
import 'package:task_managment_app/core/model/department.dart';

part 'all_department_state.dart';

class AllDepartmentCubit extends Cubit<AllDepartmentState> {
  List<Department> departments = [];
  AllDepartmentCubit() : super(AllDepartmentInitial());

  void loadAllDepartments() {
    API.getMethod(baseUrl: EndPoints.allDeparment).then((response) {
      print(response.body);
    });
  }
}
