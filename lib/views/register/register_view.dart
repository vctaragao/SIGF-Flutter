part of views;

class RegisterPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            RegisterForm(),
            FlatButton(
              textColor: Colors.blue,
              child: Text("Criar uma conta"),
              onPressed: () => Navigator.pushNamed(context, '/register'),
            )
          ],
        )));
  }
}
