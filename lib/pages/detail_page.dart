import 'package:flutter/material.dart';

import 'package:pokedex_flutter/models/pokemon_detail_model.dart';
import 'package:pokedex_flutter/models/pokemon_list_response.dart';
import 'package:pokedex_flutter/services/pokemon_detail_service.dart';

class DetailPage extends StatelessWidget {
  final styleLabels = TextStyle(fontWeight: FontWeight.w700, fontSize: 18);
  @override
  Widget build(BuildContext context) {
    final PokemonListResponse pokemon =
        ModalRoute.of(context).settings.arguments;
    final pokemonService = PokemonDetailService();
    return Scaffold(
      appBar: AppBar(
        title: Text('${pokemon.name.toUpperCase()}'),
      ),
      body: FutureBuilder(
        future: pokemonService.getPokemonDetail(pokemon.url),
        builder: (BuildContext context, AsyncSnapshot<PokemonDetail> snapshot) {
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());

          return this._showDetails(snapshot.data);
        },
      ),
    );
  }

  Widget _showDetails(PokemonDetail pokemon) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Pokemon Data:',
                style: TextStyle(
                  color: Colors.red[500],
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'ID: ${pokemon.id}',
                    style: this.styleLabels,
                  ),
                  Text(
                    'Height: ${pokemon.height}',
                    style: this.styleLabels,
                  ),
                  Text(
                    'Weight: ${pokemon.weight}',
                    style: this.styleLabels,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
