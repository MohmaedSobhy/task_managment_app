import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:synchronized/synchronized.dart';

import '../../../core/api/api.dart';
import '../../../core/api/api_keys.dart';
import '../../../core/api/end_points.dart';
import '../../../core/localization/app_string.dart';
import '../../../core/shared/shared_date.dart';

part 'add_user_state.dart';

class AddUserCubit extends Cubit<AddUserState> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  static AddUserCubit? _addUserCubit;
  static final Lock _lock = Lock();
  String user = AppString.users[0];

  AddUserCubit() : super(AddUserInitial());

  static AddUserCubit get(context) {
    if (_addUserCubit == null) {
      _lock.synchronized(() {
        _addUserCubit ??= BlocProvider.of(context);
      });
    }
    return _addUserCubit!;
  }

  void addUser() async {
    int index = AppString.users.indexOf(user);

    String token = "";
    await StorageHelper.getValue(key: APIKey.token).then((value) {
      token = value;
    });

    APIManager.postMethod(
            baseUrl: EndPoints.addUser,
            body: {
              "name": name.text.toString(),
              "email": email.text.toString(),
              "phone": phone.text.toString(),
              "password": password.text.toString(),
              "user_type": index.toString(),
            },
            token: token)
        .then((response) {});
  }

  void onChangeRadio({required String choise}) {
    user = choise;
    emit(RadioGroubState());
  }
}
