part of views;

class RegisterPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Criar Conta"),
        ),
        backgroundColor: Colors.white,
        body: Center(
            child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            RegisterForm(),
            FlatButton(
              textColor: Colors.blue,
              child: Text("Fazer login"),
              onPressed: () => Navigator.pushNamed(context, '/login'),
            )
          ],
        )));
  }
}
