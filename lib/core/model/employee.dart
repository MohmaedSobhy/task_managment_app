import 'package:task_managment_app/core/api/api_keys.dart';

class Employee {
  final int id;
  final String name;
  final String email;
  final int phone;
  final String userType;
  final int departmentId;

  Employee(
      {required this.id,
      required this.email,
      required this.name,
      required this.phone,
      required this.departmentId,
      required this.userType});

  factory Employee.fromJson(Map<String, dynamic> data) {
    return Employee(
      id: data[APIKey.id],
      email: data[APIKey.email],
      name: data[APIKey.name],
      phone: data[APIKey.phone],
      userType: data[APIKey.usertype],
      departmentId: data[APIKey.departmentId],
    );
  }
}
