import 'package:flutter/material.dart';
import 'package:sigf_flutter_app/views/views.dart';

main(List<String> args) => runApp(MyApp());

class MyApp extends StatelessWidget {
  // TODO: Setup Navigation System
  // TODO: Pass data while changing pages
  // TODO: Check witch is better (faster, memory comsum): Passing data in page changes or store localy
  // TODO: Check for the existem o the Access Token every time the page reloads or change navigation
  // TODO: Implement Logout funcionality
  // TODO: Implemente Register funcionality
  // TODO: Look for envioroment variables in Flutter/Dart

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
