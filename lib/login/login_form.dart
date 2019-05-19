import 'package:flutter/material.dart';
import 'package:sigf_flutter_app/shared_preferences/token.dart';

import '../http_request/http_request.dart';

class LoginForm extends StatefulWidget {
  dynamic loginButton;
  LoginForm({this.loginButton});

  @override
  State<StatefulWidget> createState() {
    return _LoginFormState();
  }
}

class _LoginFormState extends State<LoginForm> {
  static final emailController = TextEditingController();
  static final passwordController = TextEditingController();
  final _emailFormField = _InputFields(
    labelText: "Email",
    textInputType: TextInputType.emailAddress,
    textController: emailController,
    helperText: "email@exemplo.com",
  );
  final _passwordFormField = _InputFields(
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

class _InputFields extends StatelessWidget {
  final String helperText;
  final TextInputType textInputType;
  final String labelText;
  final bool obscureText;
  final TextEditingController textController;

  _InputFields(
      {this.labelText,
      this.textInputType,
      this.obscureText: false,
      this.textController,
      this.helperText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      decoration: InputDecoration(
        fillColor: Colors.transparent,
        labelText: labelText,
        hintText: helperText,
      ),
      keyboardType: textInputType,
      obscureText: obscureText,
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () async {
        login(
            username: _LoginFormState.emailController.text,
            password: _LoginFormState.passwordController.text);
        var token = await getToken();
        return userInfo(token);
      },
      color: Colors.teal,
      textColor: Colors.white,
      child: Text("Login"),
    );
  }
}
