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
  static final passwordConfirmController = TextEditingController();
  static final phoneController = TextEditingController();
  static final cpfController = TextEditingController();
  static final courseController = TextEditingController();
  static final profileLinkController = TextEditingController();
  static final birthdayController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final _profileLinkField = InputFields(
    labelText: "Facebook/Instagram",
    textInputType: TextInputType.url,
    textController: profileLinkController,
    validator: (value) {},
  );

  final _birthdayField = InputFields(
    labelText: "Data de nascimento",
    textInputType: TextInputType.datetime,
    textController: birthdayController,
    validator: (value) {},
    format: "##/##/####",
  );

  final _phoneField = InputFields(
    labelText: "Celular",
    textInputType: TextInputType.phone,
    textController: phoneController,
    validator: (value) {},
    format: "(##) # ####-####",
  );

  final _courseField = InputFields(
    labelText: "Curso",
    textInputType: TextInputType.text,
    textController: courseController,
    validator: (value) {},
  );

  final _cpfField = InputFields(
    labelText: "CPF",
    textInputType: TextInputType.phone,
    textController: cpfController,
    validator: (value) {},
    format: "###.###.###-##",
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

  final _passwordConfirmField = InputFields(
    labelText: "Confirmar a senha",
    textInputType: TextInputType.text,
    obscureText: true,
    textController: passwordConfirmController,
    validator: (value) {
      return validatePassword(value);
    },
  );

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
              _emailFormField,
              Padding(padding: const EdgeInsets.only(bottom: 20.0)),
              _birthdayField,
              Padding(padding: const EdgeInsets.only(bottom: 20.0)),
              _SexField(),
              Padding(padding: const EdgeInsets.only(top: 20.0)),
              _phoneField,
              Padding(padding: const EdgeInsets.only(top: 20.0)),
              _cpfField,
              Padding(padding: const EdgeInsets.only(top: 20.0)),
              _courseField,
              Padding(padding: const EdgeInsets.only(top: 20.0)),
              _profileLinkField,
              Padding(padding: const EdgeInsets.only(top: 20.0)),
              _ColarField(),
              Padding(padding: const EdgeInsets.only(top: 20.0)),
              _passwordFormField,
              Padding(padding: const EdgeInsets.only(top: 20.0)),
              _passwordConfirmField,
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

class _ColarField extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ColarFieldState();
  }
}

class _ColarFieldState extends State<_ColarField> {
  static String _colar = "Tranparente";

  void colarChange(value) {
    setState(() {
      _colar = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      value: _colar,
      items: <DropdownMenuItem>[
        DropdownMenuItem(child: Text("Tranparente"), value: "Tranparente"),
        DropdownMenuItem(child: Text("Branco"), value: "Branco"),
        DropdownMenuItem(child: Text("Azul"), value: "Azul"),
        DropdownMenuItem(child: Text("Azul Av"), value: "Azul Av"),
        DropdownMenuItem(child: Text("Preto"), value: "Preto"),
        DropdownMenuItem(child: Text("Preto Av"), value: "Preto Av"),
        DropdownMenuItem(child: Text("Vermelho"), value: "Vermelho"),
      ],
      onChanged: colarChange,
      decoration: const InputDecoration(
        isDense: true,
        labelText: "Colar",
      ),
    );
  }
}
