part of models;

class LaravelAPI {
  // IP of my computer, update every time the computer reestarts
  static const String url = 'http://192.168.1.5:80/api';
  static const Map<String, String> apiRoutes = {
    "login": "/login",
    "register": "/register",
    "getAuthUserInfo": "/user"
  };
}
