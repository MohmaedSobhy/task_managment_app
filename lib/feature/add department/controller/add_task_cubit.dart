import 'package:bloc/bloc.dart';

part 'add_task_state.dart';

class AddTaskCubit extends Cubit<AddtaskState> {
  AddTaskCubit() : super(AddtaskInitial());
}
