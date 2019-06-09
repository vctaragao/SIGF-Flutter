part of models;

class LoginTokenModel {
  String tokenType;
  int expiresIn;
  String token;
  String errorMessage;

  LoginTokenModel(
      {this.token, this.expiresIn, this.tokenType, this.errorMessage});
}
