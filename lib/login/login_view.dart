import 'package:flutter/material.dart';

import './login_form.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  AnimationController _logoAnimationController;
  Animation<double> _logoAnimation;

  @override
  void initState() {
    super.initState();
    _logoAnimationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    _logoAnimation = CurvedAnimation(
        parent: _logoAnimationController, curve: Curves.easeOut);
    _logoAnimation.addListener(() => this.setState(() {}));
    _logoAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Image(
              image: AssetImage('assets/imgs/forro_logo.png'),
              width: _logoAnimation.value * 100,
              height: _logoAnimation.value * 100,
            ),
            LoginForm(),
          ],
        )));
  }
}
