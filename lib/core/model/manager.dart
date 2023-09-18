import '../api/api_keys.dart';

class Manager {
  final int id;
  final String name;
  final String email;
  final String phone;

  Manager({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
  });

  factory Manager.fromJson(Map<String, dynamic> data) {
    return Manager(
      id: data[APIKey.id],
      name: data[APIKey.name],
      email: data[APIKey.email],
      phone: data[APIKey.phone],
    );
  }
}
