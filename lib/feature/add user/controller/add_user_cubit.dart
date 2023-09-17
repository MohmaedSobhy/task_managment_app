import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'add_user_state.dart';

class AddUserCubit extends Cubit<AddUserState> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  AddUserCubit() : super(AddUserInitial());
}
