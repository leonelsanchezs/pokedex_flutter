import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:pokedex_flutter/widgets/custom_input.dart';
import 'package:pokedex_flutter/widgets/custom_raised_btn.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.93,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/img/logo.png'),
              _Form(),
            ],
          ),
        ),
      ),
    );
  }
}

class _Form extends StatefulWidget {
  @override
  __FormState createState() => __FormState();
}

class __FormState extends State<_Form> {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: [
          CustomInput(
            icon: Icons.mail_outline,
            placeholder: 'Email',
            keyboardType: TextInputType.emailAddress,
            textController: emailCtrl,
          ),
          CustomInput(
            icon: Icons.lock_outline,
            placeholder: 'Password',
            isPassword: true,
            textController: passCtrl,
          ),
          CustomRaisedButton(
            backColor: Colors.red,
            title: 'Login',
            callback: () async {
              if (isFormValid()) {
                FocusScope.of(context).unfocus();
                final _storage = FlutterSecureStorage();
                await _storage.write(key: 'loginok', value: 'true');
                Navigator.pushReplacementNamed(context, 'home');
              }
            },
          ),
        ],
      ),
    );
  }

  bool isFormValid() {
    if (emailCtrl.text.isEmpty || passCtrl.text.isEmpty) {
      muestraAlerta();
      return false;
    }

    String emailTrim = emailCtrl.text.trim();
    String passwdTrim = passCtrl.text.trim();

    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(emailTrim);
    bool passLength = (passwdTrim.length >= 6) ? true : false;

    if (emailValid && passLength) {
      return true;
    } else {
      muestraAlerta();
      return false;
    }
  }

  void muestraAlerta() {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text('ERROR'),
              content:
                  Text('You must type a valid email and a 6 char password'),
              actions: [
                MaterialButton(
                  child: Text('Ok'),
                  elevation: 5,
                  textColor: Colors.redAccent,
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ));
  }
}
