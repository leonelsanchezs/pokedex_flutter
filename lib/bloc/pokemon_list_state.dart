part of 'pokemon_list_bloc.dart';

@immutable
class PokemonListState {
  final bool gotInfo;

  final List<PokemonListResponse> pokemonList;

  PokemonListState({
    this.gotInfo = false,
    List<PokemonListResponse> pokemonList,
  }) : this.pokemonList = pokemonList ?? List();

  PokemonListState copyWith({
    bool gotInfo,
    List<PokemonListResponse> pokemonList,
  }) =>
      PokemonListState(
        gotInfo: gotInfo ?? this.gotInfo,
        pokemonList: pokemonList ?? this.pokemonList,
      );
}
