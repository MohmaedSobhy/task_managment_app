import 'package:bloc/bloc.dart';

part 'add_department_state.dart';

class DepartmentCubit extends Cubit<DepartmentState> {
  DepartmentCubit() : super(DepartMentInitial());
}
