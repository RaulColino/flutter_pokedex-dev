import 'package:flutter/material.dart';
import 'package:flutter_pokedex/domain/entities/pokemon_entity.dart';
import 'package:flutter_pokedex/presentation/widgets/cached_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PokemonDetailScreen extends ConsumerWidget {
  const PokemonDetailScreen({super.key, required this.pokemon});

  final PokemonEntity pokemon;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //precacheImage(CachedNetworkImageProvider(pokemon.imageUrl), context);
    return Scaffold(
      appBar: AppBar(
        title: Text(pokemon.name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: pokemon.imageUrl,
              child: CachedImage(imageUrl: pokemon.imageUrl),
            ),
            Text("Height: ${pokemon.height}"),
            Text("Weight: ${pokemon.weight}"),
            Text("Types: ${pokemon.types.join(", ")}"),
          ],
        ),
      ),
    );
  }
}

// return switch (state) {
//               TodosLoading _ => const Center(child: CircularProgressIndicator()),
//               TodosError _ => Text(state.error),
//               TodosLoaded(data: final todo) => _TodoTile(data: todo),
//               TodosInitial _ => const SizedBox(),
//             };
//
// switch (state) {
//       TodosLoading _ => const Center(child: CircularProgressIndicator()),
//       TodosError _ => Text(state.error),
//       TodosLoaded(data: final todo) => _TodoTile(data: todo),
//       _ => const SizedBox(),
//   }
//
// sealed class TodosState extends Equatable { // <- Note the sealed keyword 
//   @override
//   List<Object?> get props => [];
// }
// class TodosInitial extends TodosState {}
// class TodosLoading extends TodosState {}
// class TodosLoaded extends TodosState {
//   final Todo data;
//   TodosLoaded(this.data);
//   @override
//   List<Object?> get props => [data];
// }
// class TodosError extends TodosState {
//   final String error;
//   TodosError(this.error);
//   @override
//   List<Object?> get props => [error];
// }