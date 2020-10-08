import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:pokedex_flutter/bloc/pokemon_list_bloc.dart';
import 'package:pokedex_flutter/models/pokemon_list_response.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _listViewController = ScrollController();
  @override
  void initState() {
    context.bloc<PokemonListBloc>().loadPokemonData();

    _listViewController.addListener(_scrollListener);

    super.initState();
  }

  @override
  void dispose() {
    _listViewController.removeListener(_scrollListener);
    super.dispose();
  }

  _scrollListener() {
    if (_listViewController.position.pixels >=
        _listViewController.position.maxScrollExtent - 250) {
      context.bloc<PokemonListBloc>().loadPokemonData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonListBloc, PokemonListState>(
      builder: (_, state) {
        if (!state.gotInfo) return Center(child: CircularProgressIndicator());

        return Scaffold(
          appBar: AppBar(
            title: Text('POKEDEX!'),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.exit_to_app,
                  color: Colors.white,
                ),
                onPressed: () async {
                  final _storage = FlutterSecureStorage();
                  await _storage.deleteAll();
                  Navigator.pushReplacementNamed(context, 'login');
                },
              ),
            ],
          ),
          body: Center(
            child: _listViewPokemon(state.pokemonList),
          ),
        );
      },
    );
  }

  ListView _listViewPokemon(List<PokemonListResponse> listp) {
    return ListView.separated(
      controller: _listViewController,
      physics: BouncingScrollPhysics(),
      itemCount: listp.length,
      separatorBuilder: (_, index) => Divider(),
      itemBuilder: (_, index) => _pokemonListTile(listp[index]),
    );
  }

  ListTile _pokemonListTile(PokemonListResponse pokemon) {
    return ListTile(
      title: Text('${pokemon.name.toUpperCase()}'),
      subtitle: Text('${pokemon.url}'),
      onTap: () {
        Navigator.pushNamed(context, 'details', arguments: pokemon);
      },
    );
  }
}
