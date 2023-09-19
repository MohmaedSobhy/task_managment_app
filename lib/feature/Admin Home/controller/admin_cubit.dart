import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:synchronized/synchronized.dart';
import 'package:task_managment_app/core/color/app_color.dart';
import '../../Admin%20Home/controller/admin_state.dart';

class AdminCubit extends Cubit<AdminState> {
  static AdminCubit? _adminCubit;
  static final _lock = Lock();
  bool isFirstView = false;
  Color usersTabColor = AppColor.purble;
  Color tasksTabColor = Colors.black;
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
    if (isFirstView == false) {
      usersTabColor = Colors.black;
      tasksTabColor = AppColor.purble;
    } else {
      usersTabColor = AppColor.purble;
      tasksTabColor = Colors.black;
    }
    isFirstView = !isFirstView;
    emit(ChangeTabState());
  }
}
