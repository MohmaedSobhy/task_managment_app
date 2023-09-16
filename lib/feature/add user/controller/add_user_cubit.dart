import 'package:bloc/bloc.dart';

part 'add_user_state.dart';

class AddUserCubit extends Cubit<AddUserState> {
  AddUserCubit() : super(AddUserInitial());
}
