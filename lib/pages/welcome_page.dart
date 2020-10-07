import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          strokeWidth: 4,
        ),
      ),
    );
  }

  //TODO: checar si ya esta logueado el usuario, si esta logueado ir a home page
}
