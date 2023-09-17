import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_user_state.dart';

class AddUserCubit extends Cubit<AddUserState> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  AddUserCubit() : super(AddUserInitial());

  static AddUserCubit get(context) {
    return BlocProvider.of(context);
  }

  void addUser() {}
}
