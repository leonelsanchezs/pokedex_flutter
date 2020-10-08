import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_flutter/bloc/pokemon_list_bloc.dart';

import 'package:pokedex_flutter/pages/detail_page.dart';
import 'package:pokedex_flutter/pages/home_page.dart';
import 'package:pokedex_flutter/pages/login_page.dart';
import 'package:pokedex_flutter/pages/welcome_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => PokemonListBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pokedex!',
        home: WelcomePage(),
        routes: {
          'welcome': (_) => WelcomePage(),
          'login': (_) => LoginPage(),
          'home': (_) => HomePage(),
          'details': (_) => DetailPage(),
        },
      ),
    );
  }
}
