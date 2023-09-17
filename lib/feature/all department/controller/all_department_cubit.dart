import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:task_managment_app/core/model/department.dart';

part 'all_department_state.dart';

class AllDepartmentCubit extends Cubit<AllDepartmentState> {
  List<Department> departments = [];
  AllDepartmentCubit() : super(AllDepartmentInitial());

  void loadAllDepartments() {}
}
