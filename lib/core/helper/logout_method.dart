import 'package:task_managment_app/core/shared/shared_date.dart';

abstract class Logout {
  static void logoutFromApp() {
    StorageHelper.deleteAllData();
  }
}
