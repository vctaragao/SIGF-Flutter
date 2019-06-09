part of main;

class MyApp extends StatelessWidget {
// TODO: Await for the token to be fully stored inside the user device
// TODO: Check for the existem o the Access Token every time the page reloads or change navigation
// TODO: Implement Logout funcionality
// TODO: Implemente Register funcionality

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
      theme: ThemeData(primarySwatch: Colors.teal),
    );
  }
}
