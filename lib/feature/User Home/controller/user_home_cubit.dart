import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:synchronized/synchronized.dart';
import '../../../core/api/api_keys.dart';
import '../../../core/shared/shared_date.dart';
import 'user_home_state.dart';

class UserHomeCubit extends Cubit<UserHomseState> {
  String userName = '';
  bool isUser = false, isManager = false, isAdmin = false;
  static UserHomeCubit? _home;
  String currentDate = DateTime.now().toString().substring(0, 10);
  static final _lock = Lock();
  DateTime selectedDate = DateTime.now();

  UserHomeCubit() : super(UserHomeInitail());

  static UserHomeCubit get(context) {
    if (_home == null) {
      _lock.synchronized(() {
        _home ??= BlocProvider.of(context);
      });
    }
    return _home!;
  }

  void initialData() async {
    await Future.wait([_setUserName(), _defineUserType()]);
  }

  Future<void> _setUserName() async {
    await StorageHelper.getValue(key: APIKey.user).then((name) {
      userName = name;
    });
  }

  Future<void> _defineUserType() async {
    await StorageHelper.getValue(key: APIKey.usertype).then((type) {
      if (type == "user") {
        isUser = true;
      } else if (type == "manager") {
        isManager = true;
      } else if (type == "admin") {
        isAdmin = true;
      }
    });
  }

  void onDateChange(DateTime dateTime) {
    selectedDate = dateTime;
    emit(ChangeDateState());
  }
}
