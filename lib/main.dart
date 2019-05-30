import 'package:flutter/material.dart';
import 'package:sigf_flutter_app/views/views.dart';

main(List<String> args) => runApp(MyApp());

class MyApp extends StatelessWidget {
  // TODO: Setup Navigation System with routes name and passing data.
  // TODO: Set up error messages for the login page
  // TODO: Await for the token to be fully stored inside the user device
  // TODO: Check for the existem o the Access Token every time the page reloads or change navigation
  // TODO: Implement Logout funcionality
  // TODO: Implemente Register funcionality

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
      theme: ThemeData(primarySwatch: Colors.teal),
      routes: <String, WidgetBuilder>{
        '/profile': (BuildContext context) => ProfilePage(),
      },
    );
  }
}
