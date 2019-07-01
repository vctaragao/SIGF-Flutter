part of controllers;

abstract class LoginController {
  static Future<LoginTokenModel> login({username, password, context}) async {
    try {
      return await http.post(LaravelAPI.urlApi + LaravelAPI.apiRoutes['login'],
          headers: {
            "Accept": "application/json"
          },
          body: {
            "username": username,
            "password": password
          }).then((http.Response response) async {
        final int statusCode = response.statusCode;

        if (statusCode < 200 || statusCode > 400) {
          throw LoginError(statusCode);
        }

        saveCurrentToken(json.decode(response.body));

        var token = await getToken();

        LoginTokenModel tokenModel = LoginTokenModel(
          token: token['token'],
          tokenType: token['tokenType'],
          expiresIn: token['expiresIn'],
        );

        return tokenModel;
      }).timeout(Duration(seconds: 60));
    } on TimeoutException {
      return LoginTokenModel(
          errorMessage:
              "Tempo de conexão excedido, tente novamente em alguns instantes.");
    } on LoginError catch (e) {
      if (e.message == 401)
        return LoginTokenModel(errorMessage: "Email ou senha inválidos");
      else if (e.message >= 500)
        return LoginTokenModel(
            errorMessage:
                "Erro no servidor, tente novamente em alguns instantes");
      else
        return LoginTokenModel(
            errorMessage:
                "Aconteceu um erro inesperado, por favor tente novamente");
    }
  }
}

class LoginError implements Exception {
  int message;

  LoginError(this.message);
}
