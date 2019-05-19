import 'package:flutter/material.dart';
import 'package:sigf_flutter_app/views/views.dart';

main(List<String> args) => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
      theme: ThemeData(primarySwatch: Colors.teal),
    );
  }
}
