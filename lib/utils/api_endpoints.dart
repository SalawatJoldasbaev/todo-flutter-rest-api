class ApiEndPoints {
  static const String baseUrl = "https://todo.paydali.uz/api/";
  static _AuthEndPoints authEndPoints = _AuthEndPoints();
}

class _AuthEndPoints {
  final String register = "register";
  final String login = "login";
}