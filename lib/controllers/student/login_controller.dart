part of controllers;

abstract class LoginController {
  static Future<LoginTokenModel> login({username, password}) async {
    return await http.post('http://192.168.1.2/api/login', headers: {
      "Accept": "application/json"
    }, body: {
      "username": username,
      "password": password
    }).then((http.Response response) async {
      final int statusCode = response.statusCode;
      if (statusCode < 200 || statusCode > 400) {
        throw new Exception("Error while fetching data $statusCode");
      }
      saveCurrentToken(json.decode(response.body));
      var token = await getToken();
      LoginTokenModel tokenModel = LoginTokenModel(
        token: token['token'],
        tokenType: token['tokenType'],
        expiresIn: token['expiresIn'],
      );
      return tokenModel;
    });
  }
}
