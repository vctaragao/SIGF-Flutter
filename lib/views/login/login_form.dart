part of views;

class LoginForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginFormState();
  }
}

class _LoginFormState extends State<LoginForm> {
  static final emailController = TextEditingController();
  static final passwordController = TextEditingController();
  final _emailFormField = InputFields(
    labelText: "Email",
    textInputType: TextInputType.emailAddress,
    textController: emailController,
    helperText: "email@exemplo.com",
  );
  final _passwordFormField = InputFields(
    labelText: "Senha",
    textInputType: TextInputType.text,
    obscureText: true,
    textController: passwordController,
  );

  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Theme(
        data: ThemeData(
            primarySwatch: Colors.teal,
            inputDecorationTheme: InputDecorationTheme(
                labelStyle: TextStyle(color: Colors.teal, fontSize: 20.0),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal, width: 1.5)))),
        child: Container(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              _emailFormField,
              Padding(padding: const EdgeInsets.only(bottom: 20.0)),
              _passwordFormField,
              Padding(padding: const EdgeInsets.only(top: 20.0)),
              _LoginButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () async {
        var token = await LoginController.login(
            username: _LoginFormState.emailController.text,
            password: _LoginFormState.passwordController.text);
        var student = await GetInfoController.getStudent(token: token);
        student.show();
        return student;
      },
      color: Colors.teal,
      textColor: Colors.white,
      child: Text("Login"),
    );
  }
}
