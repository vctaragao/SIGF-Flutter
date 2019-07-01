part of views;

class RegisterForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RegisterFormState();
  }
}

class _RegisterFormState extends State<RegisterForm> {
  static final nameController = TextEditingController();
  static final emailController = TextEditingController();
  static final passwordController = TextEditingController();
  static final phoneController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final _phoneField = InputFields(
    labelText: "Celular",
    textInputType: TextInputType.phone,
    textController: phoneController,
    validator: (value) {},
  );

  final _nameField = InputFields(
    labelText: "Nome",
    textInputType: TextInputType.text,
    textController: nameController,
  );

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
              _nameField,
              Padding(padding: const EdgeInsets.only(bottom: 20.0)),
              _SexField(),
              Padding(padding: const EdgeInsets.only(top: 20.0)),
              _phoneField,
              Padding(padding: const EdgeInsets.only(top: 20.0)),
              _emailFormField,
              Padding(padding: const EdgeInsets.only(bottom: 20.0)),
              _passwordFormField,
              Padding(padding: const EdgeInsets.only(top: 20.0)),
              _RegisterButton(
                formKey: _formKey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RegisterButton extends StatelessWidget {
  GlobalKey<FormState> formKey;

  _RegisterButton({this.formKey});

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
            Navigator.pushNamed(context, '/home', arguments: student.toJson());
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
      child: Text("Criar conta"),
    );
  }
}

class _SexField extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SexFieldState();
  }
}

class _SexFieldState extends State<_SexField> {
  static String _sex = "Feminino";

  void sexChange(value) {
    setState(() {
      _sex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      value: _sex,
      items: <DropdownMenuItem>[
        DropdownMenuItem(child: Text("Masculino"), value: "Masculino"),
        DropdownMenuItem(child: Text("Feminino"), value: "Feminino"),
        DropdownMenuItem(child: Text("Outro"), value: "Outro")
      ],
      onChanged: sexChange,
      decoration: const InputDecoration(
        isDense: true,
        labelText: "Sexo",
      ),
    );
  }
}
