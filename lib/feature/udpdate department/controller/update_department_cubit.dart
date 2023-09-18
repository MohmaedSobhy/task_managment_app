import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:synchronized/synchronized.dart';
part 'update_department_state.dart';

class UpdateDepartmentCubit extends Cubit<UpdateDepartmentState> {
  static UpdateDepartmentCubit? _updateDepartment;
  static final _lock = Lock();
  UpdateDepartmentCubit() : super(UpdateDepartmentInitial());

  static UpdateDepartmentCubit get(context) {
    if (_updateDepartment == null) {
      _lock.synchronized(() {
        _updateDepartment = BlocProvider.of(context);
      });
    }
    return _updateDepartment!;
  }
}
