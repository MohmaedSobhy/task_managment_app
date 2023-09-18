import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  String user = AppString.users[0];

  AddUserCubit() : super(AddUserInitial());

  static AddUserCubit get(context) {
    return BlocProvider.of(context);
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
