import 'package:bloc/bloc.dart';

import 'package:task_managment_app/feature/Admin%20Home/controller/admin_state.dart';

class AdminCubit extends Cubit<AdminState> {
  AdminCubit() : super(AdminInitial());
}
