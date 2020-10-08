import 'package:http/http.dart' as http;
import 'package:pokedex_flutter/global/enviroments.dart';

import 'package:pokedex_flutter/models/pokemon_detail_model.dart';

class PokemonDetailService {
  Future<PokemonDetail> getPokemonDetail(String id) async {
    try {
      final url = Uri.https(Enviromients.apiURL, 'api/v2/pokemon/$id');
      final resp = await http.get(url);
      final pokemon = pokemonDetailFromJson(resp.body);
      return pokemon;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
