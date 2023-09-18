import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:synchronized/synchronized.dart';
import 'package:task_managment_app/core/api/api_keys.dart';
import 'package:task_managment_app/core/shared/shared_date.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  String userName = '';
  bool isUser = false, isManager = false, isAdmin = false;
  static HomeCubit? _home;
  String currentDate = DateTime.now().toString().substring(0, 10);
  static final _lock = Lock();

  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) {
    if (_home == null) {
      _lock.synchronized(() {
        _home ??= BlocProvider.of(context);
      });
    }
    return _home!;
  }

  void initialData() async {
    printObject();
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

  void printObject() {
    print(identityHashCode(_home));
  }

  // view All taskes
}
