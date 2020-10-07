import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('POKEDEX!'),
      ),
      body: Center(
        child: _listViewPokemon(context),
      ),
    );
  }

  ListView _listViewPokemon(BuildContext context) {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      itemCount: 10,
      separatorBuilder: (_, index) => Divider(),
      itemBuilder: (_, index) => _pokemonListTile(index, context),
    );
  }

  ListTile _pokemonListTile(int index, BuildContext context) {
    return ListTile(
      title: Text('Titulo: ${index.toString()}'),
      subtitle: Text('SubTitulo: ${index.toString()}'),
      onTap: () {
        Navigator.pushNamed(context, 'details');
      },
    );
  }
}
