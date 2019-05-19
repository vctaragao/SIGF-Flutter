class LoginTokenModel {
  String tokenType;
  int expiresIn;
  String token;

  LoginTokenModel({this.token, this.expiresIn, this.tokenType});

  LoginTokenModel.fromJson({Map<String, dynamic> json}) {
    tokenType = json['token_type'];
    expiresIn = json['expires_in'];
    token = json['access_token'];
  }
}
