import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_managment_app/core/api/api_keys.dart';
import 'package:task_managment_app/core/shared/shared_date.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  String userName = '';
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) {
    return BlocProvider.of(context);
  }

  void getUserName() {
    StorageHelper.getValue(key: APIKey.user).then((name) {
      userName = name;
    });
  }
}
