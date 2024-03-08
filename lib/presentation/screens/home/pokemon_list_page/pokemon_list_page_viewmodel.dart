import 'dart:async';

import 'package:flutter_pokedex/domain/entities/pokemon_entity.dart';
import 'package:flutter_pokedex/domain/services/pokemon_service.dart';
import 'package:flutter_pokedex/presentation/screens/home/pokemon_list_page/pokemon_list_page.dart';
import 'package:flutter_pokedex/presentation/utils/di/service_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



class PokemonListPageViewModel extends AsyncNotifier<List<PokemonEntity>> {
  @override
  FutureOr<List<PokemonEntity>> build() {
    return [];
  }

  Future<void> getPokemon() async {
    final PokemonService pokemonService = ref.read(pokemonServiceProvider);
    state = const AsyncLoading();
    pokemonService.getPokemonList().then((value) {
      value.when(
        ok: (pokemonList) {
          state = AsyncData(pokemonList);
        },
        err: (error) {
          state = AsyncError(error, StackTrace.current);
        },
      );
    }).catchError((error) {
      state = AsyncError(error, StackTrace.current);
    });
  }
}

final pokemonListPageViewModelProvider = AsyncNotifierProvider<PokemonListPageViewModel, List<PokemonEntity>>(PokemonListPageViewModel.new);
