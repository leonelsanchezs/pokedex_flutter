import 'package:flutter/material.dart';
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
              FadeInImage(
                placeholder: AssetImage('assets/img/loading.gif'),
                image: NetworkImage(
                    'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/62902855-31e8-48de-986e-5080e8ef5f15/d5uxsvu-cbf56dfe-0c82-40f9-928b-1e756acf0236.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOiIsImlzcyI6InVybjphcHA6Iiwib2JqIjpbW3sicGF0aCI6IlwvZlwvNjI5MDI4NTUtMzFlOC00OGRlLTk4NmUtNTA4MGU4ZWY1ZjE1XC9kNXV4c3Z1LWNiZjU2ZGZlLTBjODItNDBmOS05MjhiLTFlNzU2YWNmMDIzNi5wbmcifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6ZmlsZS5kb3dubG9hZCJdfQ.2zLsxmr6hCqcUNfeDQCmgJ4MXZ6OA-oU_kWdoX6C4-A'),
              ),
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
            callback: () {
              Navigator.pushReplacementNamed(context, 'home');
            },
          ),
        ],
      ),
    );
  }
}
