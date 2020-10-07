import 'package:flutter/material.dart';

import 'package:pokedex_flutter/pages/detail_page.dart';
import 'package:pokedex_flutter/pages/home_page.dart';
import 'package:pokedex_flutter/pages/login_page.dart';
import 'package:pokedex_flutter/pages/welcome_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pokedex!',
      home: HomePage(),
      routes: {
        'welcome': (_) => WelcomePage(),
        'login': (_) => LoginPage(),
        'home': (_) => HomePage(),
        'details': (_) => DetailPage(),
      },
    );
  }
}
