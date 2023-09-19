abstract class EndPoints {
  static const String _baseUrl = "https://tasksapp.integration25.com/api/";
  static const String login = "${_baseUrl}auth/login";
  static const String addDepartment = "${_baseUrl}department/store";
  static const String addUser = "${_baseUrl}user/store";
  static const String allDeparment = "${_baseUrl}department/index";
  static const String updateDepartment = "${_baseUrl}department/update/";
  static const String allManagers = "${_baseUrl}user/show-managers";
  static const String showallEmployee = "${_baseUrl}user/show-employees";
  static const String addTask = "${_baseUrl}task/store";
}
