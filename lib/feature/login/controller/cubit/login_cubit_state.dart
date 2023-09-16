part of 'login_cubit_cubit.dart';

abstract class LoginState {}

final class LoginCubitInitial extends LoginState {}

final class CheckBoxState extends LoginState {}

final class LoginSucceed extends LoginState {}

final class LoginFailed extends LoginState {}

final class LoginLoading extends LoginState {}
