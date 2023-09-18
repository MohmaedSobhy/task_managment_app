import '../api/api_keys.dart';

class Manager {
  int? id;
  String? name;
  String? email;
  int? phone;
  String? status;
  String? userType;

  Manager({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.status,
    required this.userType,
  });

  factory Manager.fromJson(Map<String, dynamic> data) {
    return Manager(
      id: data[APIKey.id],
      name: data[APIKey.name],
      email: data[APIKey.email],
      phone: data[APIKey.phone],
      userType: data[APIKey.usertype],
      status: data[APIKey.status],
    );
  }
}
