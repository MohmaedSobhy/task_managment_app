import 'package:task_managment_app/core/api/api_keys.dart';
import 'package:task_managment_app/core/model/manager.dart';

class Department {
  final int id;
  final String name;
  final Manager? mangager;
  Department({required this.id, required this.name, this.mangager});

  factory Department.fromJson({required Map<String, dynamic> data}) {
    return Department(
      id: data[APIKey.id],
      name: data[APIKey.name],
      mangager: (data[APIKey.manager] != null)
          ? Manager.fromJson(data[APIKey.manager])
          : null,
    );
  }
}
