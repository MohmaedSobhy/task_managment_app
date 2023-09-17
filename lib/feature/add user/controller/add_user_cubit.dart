import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_managment_app/core/localization/app_string.dart';
part 'add_user_state.dart';

class AddUserCubit extends Cubit<AddUserState> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  String user = AppString.users[0];

  AddUserCubit() : super(AddUserInitial());

  static AddUserCubit get(context) {
    return BlocProvider.of(context);
  }

  void addUser() {}

  void onChangeRadio({required String choise}) {
    user = choise;
    emit(RadioGroubState());
  }
}
