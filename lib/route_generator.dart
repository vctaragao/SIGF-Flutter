part of main;

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        if (args is Map<String, dynamic>) {
          return MaterialPageRoute(builder: (_) => ProfilePage(args));
        } else
          return MaterialPageRoute(builder: (_) => _Page404());
        break;
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginPage());
      case '/home':
        return MaterialPageRoute(builder: (_) => ProfilePage(args));
      case '/register':
        return MaterialPageRoute(builder: (_) => RegisterPage());
      default:
        return MaterialPageRoute(builder: (_) => _Page404());
    }
  }
}

class _Page404 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("404"),
    );
  }
}
