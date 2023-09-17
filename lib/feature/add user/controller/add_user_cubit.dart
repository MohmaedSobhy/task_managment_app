import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_managment_app/core/api/api.dart';
import 'package:task_managment_app/core/api/api_keys.dart';
import 'package:task_managment_app/core/api/end_points.dart';
import 'package:task_managment_app/core/localization/app_string.dart';
import 'package:task_managment_app/core/shared/shared_date.dart';
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

  void addUser() {
    int index = AppString.users.indexOf(user);
    Map<String, dynamic> body = {
      APIKey.name: name.text.toString(),
      APIKey.phone: phone.text.toString(),
      APIKey.password: password.text.toString(),
      APIKey.usertype: index,
      APIKey.email: email,
    };
    String token = "";
    StorageHelper.getValue(key: APIKey.token).then((value) {
      token = value;
    });

    API
        .postMethod(baseUrl: EndPoints.addUser, body: body, token: token)
        .then((value) {});
  }

  void onChangeRadio({required String choise}) {
    user = choise;
    emit(RadioGroubState());
  }
}
