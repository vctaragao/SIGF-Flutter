part of main;

class LaravelAPI {
  // IP of my computer, update every time the computer reestarts
  static const String url = 'http://192.168.1.2';
  static const String urlApi = 'http://192.168.1.2:80/api';
  static const Map<String, String> apiRoutes = {
    "login": "/login",
    "register": "/register",
    "getAuthUserInfo": "/user"
  };
}
