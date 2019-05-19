import 'package:http/http.dart' as http;
import 'package:sigf_flutter_app/model/login_token.dart';

import '../shared_preferences/token.dart';

import 'dart:convert';
import 'dart:async';

Future<http.Response> login({username, password}) async {
  return await http.post('http://192.168.1.4:80/api/login', headers: {
    "Accept": "application/json"
  }, body: {
    "username": username,
    "password": password
  }).then((http.Response response) {
    final int statusCode = response.statusCode;
    if (statusCode < 200 || statusCode > 400) {
      throw new Exception("Error while fetching data $statusCode");
    }
    saveCurrentToken(json.decode(response.body));
  });
}

Future<http.Response> userInfo(LoginTokenModel token) async {
  return await http.get('http://192.168.1.4/api/user', headers: {
    "Authorization": "${token.tokenType} ${token.token}",
    "Accept": "application/json"
  }).then((http.Response response) {
    final int statusCode = response.statusCode;
    if (statusCode < 200 || statusCode > 400) {
      print(statusCode);
      throw new Exception("Error while fetching data");
    }
    print(json.decode(response.body));
  });
}
