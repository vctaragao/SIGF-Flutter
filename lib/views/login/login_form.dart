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

  final _formKey = GlobalKey<FormState>();

  final _emailFormField = InputFields(
    labelText: "Email",
    textInputType: TextInputType.emailAddress,
    textController: emailController,
    helperText: "email@exemplo.com",
    validator: (value) {
      return validateEmail(value);
    },
  );
  final _passwordFormField = InputFields(
    labelText: "Senha",
    textInputType: TextInputType.text,
    obscureText: true,
    textController: passwordController,
    validator: (value) {
      return validatePassword(value);
    },
  );

  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
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
              _LoginButton(
                formKey: _formKey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  GlobalKey<FormState> formKey;

  _LoginButton({this.formKey});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () async {
        // Remove focus from keyboard after the login button is pressed
        FocusScope.of(context).requestFocus(new FocusNode());

        if (formKey.currentState.validate()) {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text('Processando'),
          ));

          var token = await LoginController.login(
              username: _LoginFormState.emailController.text,
              password: _LoginFormState.passwordController.text);

          if (token.errorMessage == null) {
            var student = await GetInfoController.getStudent(token: token);
            print(student.toJson());
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProfilePage(student.toJson())));
          } else {
            Scaffold.of(context).showSnackBar(SnackBar(
              content: Text(token.errorMessage),
              backgroundColor: Colors.red,
            ));
          }
        }
      },
      color: Colors.teal,
      textColor: Colors.white,
      child: Text("Login"),
    );
  }
}
