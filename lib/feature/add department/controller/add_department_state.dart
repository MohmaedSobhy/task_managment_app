part of 'add_department_cubit.dart';

abstract class AddDepartmentState {}

class AddDepartmentInitial extends AddDepartmentState {}

class FailedAddDepartment extends AddDepartmentState {}

class SucceedAddDepartment extends AddDepartmentState {}

class ErrorAddDepartment extends AddDepartmentState {}
