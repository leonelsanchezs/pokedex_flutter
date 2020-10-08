import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex_flutter/global/enviroments.dart';

import 'package:pokedex_flutter/models/pokemon_list_response.dart';

part 'pokemon_list_event.dart';
part 'pokemon_list_state.dart';

class PokemonListBloc extends Bloc<PokemonListEvent, PokemonListState> {
  PokemonListBloc() : super(PokemonListState());

  List<PokemonListResponse> _listPokemon = [];
  bool _isLoading = false;

  void loadPokemonData() async {
    if (_isLoading) return;
    try {
      _isLoading = true;
      final url = Uri.https(
        Enviromients.apiURL,
        'api/v2/pokemon',
        {'limit': '20', 'offset': '${this._listPokemon.length}'},
      );

      final answer = await http.get(url);
      final decodedData = json.decode(answer.body);
      if (decodedData["results"] == null) return;
      for (var item in decodedData["results"]) {
        final pokemonItem = PokemonListResponse.fromJson(item);
        this._listPokemon.add(pokemonItem);
      }
      _isLoading = false;

      add(OnDataLoaded());
    } catch (e) {
      print(e);
    }
  }

  @override
  Stream<PokemonListState> mapEventToState(PokemonListEvent event) async* {
    if (event is OnDataLoaded) {
      yield state.copyWith(gotInfo: true, pokemonList: this._listPokemon);
    }
  }
}
