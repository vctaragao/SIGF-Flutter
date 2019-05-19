part of models;

class LoginTokenModel {
  String tokenType;
  int expiresIn;
  String token;

  LoginTokenModel({this.token, this.expiresIn, this.tokenType});
}
