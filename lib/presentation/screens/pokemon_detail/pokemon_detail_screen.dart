import 'package:flutter/material.dart';
import 'package:flutter_pokedex/domain/entities/pokemon_details.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PokemonDetailScreen extends ConsumerWidget {
  final PokemonDetails pokemon;
  const PokemonDetailScreen({super.key, required this.pokemon} );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pokemon.name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(pokemon.imageUrl),
            Text("Height: ${pokemon.height}"),
            Text("Weight: ${pokemon.weight}"),
            Text("Types: ${pokemon.types.join(", ")}"),
          ],
        ),
      ),
    );
  }
}