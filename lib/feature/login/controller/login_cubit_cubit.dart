import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/api/api.dart';
import '../../../../core/api/end_points.dart';
part 'login_cubit_state.dart';

class LoginCubit extends Cubit<LoginState> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool checkBoxValue = false;
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  LoginCubit() : super(LoginCubitInitial());

  static LoginCubit get(context) {
    return BlocProvider.of(context);
  }

  void checkBoxState() {
    checkBoxValue = !checkBoxValue;
    emit(CheckBoxState());
  }

  void userLogin() {
    String email = emailController.text.toString();
    String password = passwordController.text.toString();
    API.postMethod(baseUrl: EndPoints.login, body: {
      'email': email,
      'password': password,
    }).then((response) {
      if (checkBoxValue) {}
    }).catchError((error) {});
  }
}
