import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:synchronized/synchronized.dart';

import '../../../core/api/api.dart';
import '../../../core/api/api_keys.dart';
import '../../../core/api/end_points.dart';
import '../../../core/shared/shared_date.dart';
import 'login_cubit_state.dart';

class LoginCubit extends Cubit<LoginState> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool checkBoxValue = false;
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  static final Lock _lock = Lock();
  static LoginCubit? _loginCubit;
  LoginCubit() : super(LoginCubitInitial());

  static LoginCubit get(context) {
    if (_loginCubit == null) {
      _lock.synchronized(() {
        _loginCubit = BlocProvider.of(context);
      });
    }
    return _loginCubit!;
  }

  void checkBoxState() {
    checkBoxValue = !checkBoxValue;
    emit(CheckBoxState());
  }

  void userLogin() {
    String email = emailController.text.toString();
    String password = passwordController.text.toString();
    APIManager.postMethod(baseUrl: EndPoints.login, body: {
      'email': email,
      'password': password,
    }).then((response) {
      Map<String, dynamic> data = jsonDecode(response.body);
      _succefullResponse(json: data['data']);
    }).catchError((error) {});
  }

  void _succefullResponse({required Map<String, dynamic> json}) {
    if (checkBoxValue) {
      StorageHelper.addKey(key: APIKey.keepLogin, value: "inApp");
    }
    StorageHelper.addKey(key: APIKey.token, value: json[APIKey.token]);
    StorageHelper.addKey(key: APIKey.user, value: json[APIKey.user]);
    StorageHelper.addKey(key: APIKey.usertype, value: json[APIKey.usertype]);

    emit(LoginSucceed());
  }
}
