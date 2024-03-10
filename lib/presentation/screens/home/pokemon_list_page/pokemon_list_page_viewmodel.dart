import 'dart:async';

import 'package:flutter_pokedex/domain/entities/pokemon_entity.dart';
import 'package:flutter_pokedex/domain/services/pokemon_service.dart';
import 'package:flutter_pokedex/presentation/utils/di/service_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



//Viewmodel
class PokemonListPageViewModel extends AsyncNotifier<List<PokemonEntity>> {
  
  @override
  FutureOr<List<PokemonEntity>> build() {
    return _fetchPokemon();
  }

  Future<List<PokemonEntity>> _fetchPokemon() async {
    final PokemonService pokemonService = ref.read(pokemonServiceProvider);
    final result = await pokemonService.getPokemonList();
    return result.unwrap();
  }

  // Future<void> getPokemon() async {
  //   final PokemonService pokemonService = ref.read(pokemonServiceProvider);
  //   state = const AsyncLoading();
  //   pokemonService.getPokemonList().then((value) {
  //     value.when(
  //       ok: (pokemonList) {
  //         state = AsyncData(pokemonList);
  //       },
  //       err: (error) {
  //         state = AsyncError(error, StackTrace.current);
  //       },
  //     );
  //   }).catchError((error) {
  //     state = AsyncError(error, StackTrace.current);
  //   });
  // }
}


//Provider
final pokemonListPageViewModelProvider = AsyncNotifierProvider<PokemonListPageViewModel, List<PokemonEntity>>(PokemonListPageViewModel.new);



