import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:synchronized/synchronized.dart';
import 'package:task_managment_app/feature/Admin%20Home/controller/admin_state.dart';

class AdminCubit extends Cubit<AdminState> {
  static AdminCubit? _adminCubit;
  static final _lock = Lock();

  AdminCubit() : super(AdminInitial());

  static AdminCubit get(context) {
    if (_adminCubit == null) {
      _lock.synchronized(() {
        _adminCubit ??= BlocProvider.of(context);
      });
    }
    return _adminCubit!;
  }

  void changeTabView() {
    emit(ChangeTabState());
  }
}
