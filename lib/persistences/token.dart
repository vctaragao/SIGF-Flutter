part of persistences;

Future<void> saveCurrentToken(Map responseJson) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();

  var token = (responseJson != null && responseJson.isNotEmpty)
      ? responseJson['access_token']
      : "";
  var tokenType = (responseJson != null && responseJson.isNotEmpty)
      ? responseJson['token_type']
      : "";
  var expiresIn = (responseJson != null && responseJson.isNotEmpty)
      ? responseJson['expires_in']
      : 0;

  await preferences.setString(
      'LastToken', (token != null && token.length > 0) ? token : "");
  await preferences.setString('LastTokenType',
      (tokenType != null && tokenType.length > 0) ? tokenType : "");
  await preferences.setInt('LastTokenExpiresIn',
      (expiresIn != null && expiresIn >= 0) ? expiresIn : null);
}

Future<Map<String, dynamic>> getToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String token = prefs.getString('LastToken');
  String tokenType = prefs.getString('LastTokenType');
  int expiresIn = prefs.getInt('LastTokenExpiresIn');

  Map<String, dynamic> currenToken = {
    "token": token,
    "tokenType": tokenType,
    "expiresIn": expiresIn,
  };

  return currenToken;
}
