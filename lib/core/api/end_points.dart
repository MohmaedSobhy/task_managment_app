abstract class EndPoints {
  static String baseUrl = "https://tasksapp.integration25.com/api/";
  static String login = "${baseUrl}auth/login";
  static String addDepartment = "${baseUrl}department/store";
  static String addUser = "${baseUrl}user/store";
  static String allDeparment = "${baseUrl}department/index";
  static String updateDepartment = "${baseUrl}department/update/";
  static String allManagers = "${baseUrl}user/show-managers";
  static String allEmployee = "${baseUrl}user/index";
}
