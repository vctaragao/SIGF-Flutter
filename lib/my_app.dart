part of main;

class MyApp extends StatelessWidget {
// TODO: Implement Logout funcionality
// TODO: Implemente Register funcionality

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
      onGenerateRoute: RouteGenerator.generateRoute,
      theme: ThemeData(primarySwatch: Colors.teal),
    );
  }
}
