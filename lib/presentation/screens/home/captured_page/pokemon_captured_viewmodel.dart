// ignore_for_file: public_member_api_docs, sort_constructors_first
//var inputText = _searchController.text;
//var filteredPokemonCaptured = pokemon_captured.where((pok) => pok.name.toLowerCase().contains(inputText.toLowerCase())).toList();

//La lista de Pokémon capturados debe aparecer ordenada por su id.
//Posibilidad de filtrar por tipo
//y a ordenarlos alfabéticamente.
import 'dart:async';

import 'package:flutter_pokedex/presentation/utils/di/app_services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_pokedex/domain/entities/pokemon_entity.dart';
import 'package:oxidized/oxidized.dart';

enum PokemonCapturedOrder { byId, alphabeticallyAsc, alphabeticallyDesc }

enum PokemonCapturedFilter {
  all,
  bug,
  dark,
  dragon,
  electric,
  fairy,
  fighting,
  fire,
  flying,
  ghost,
  grass,
  ground,
  ice,
  normal,
  poison,
  psychic,
  rock,
  steel,
  water
}

//State
class PokemonCapturedState {
  final AutoDisposeFutureProvider<List<PokemonEntity>> _pokemonCaptured;
  final AsyncValue<List<PokemonEntity>> filteredPokemonCaptured;
  final PokemonCapturedOrder order;
  final PokemonCapturedFilter filter;

  PokemonCapturedState({
    required AutoDisposeFutureProvider<List<PokemonEntity>> pokemonCaptured,
    required this.filteredPokemonCaptured,
    required this.order,
    required this.filter,
  }) : _pokemonCaptured = pokemonCaptured;


  PokemonCapturedState copyWith({
    AutoDisposeFutureProvider<List<PokemonEntity>>? pokemonCaptured,
    AsyncValue<List<PokemonEntity>>? filteredPokemonCaptured,
    PokemonCapturedOrder? order,
    PokemonCapturedFilter? filter,
  }) {
    return PokemonCapturedState(
      pokemonCaptured: pokemonCaptured ?? _pokemonCaptured,
      filteredPokemonCaptured: filteredPokemonCaptured ?? this.filteredPokemonCaptured,
      order: order ?? this.order,
      filter: filter ?? this.filter,
    );
  }
}

//PokemonCapturedProvider
final _pokemonCapturedProvider = FutureProvider.autoDispose<List<PokemonEntity>>((ref) async {
  final pokemonService = ref.read(AppServices.pokemonServiceProvider);
  final res =  pokemonService.getPokemonCaptured();
  return res.unwrap();
});

//Viewmodel
class PokemonCapturedViewmodel extends Notifier<PokemonCapturedState> {
  @override
  PokemonCapturedState build() {
     final pokemonCaptured = ref.read(_pokemonCapturedProvider);
      return PokemonCapturedState(
        pokemonCaptured: _pokemonCapturedProvider,
        filteredPokemonCaptured: pokemonCaptured,
        order: PokemonCapturedOrder.byId,
        filter: PokemonCapturedFilter.all,
      );
    }
  }

  // Future<List<PokemonEntity>> _retrieveCapturedPokemon() async {
  //   final pokemonService = ref.read(pokemonServiceProvider);
  //   final res =  pokemonService.getPokemonCaptured();
  //   return res.unwrap();
  // }

  void addPokemon(PokemonEntity pokemon) {
    //state = state.copyWith(pokemonCaptured: state._pokemonCaptured..add(pokemon));
  }

  void removePokemon(PokemonEntity pokemon) {
    state = state.copyWith(pokemonCaptured: state._pokemonCaptured..remove(pokemon));
  }

  void changeOrder(PokemonCapturedOrder order) {
    final filteredByOrder = _filterPokemonByOrder(state._pokemonCaptured, order);
    state = state.copyWith(filteredPokemonCaptured: filteredByOrder, order: order);
  }

  void changeFilter(PokemonCapturedFilter filter) {
    final filteredByType = _filterPokemonByType(state._pokemonCaptured, filter);
    state = state.copyWith(filteredPokemonCaptured: filteredByType, filter: filter);
  }

  List<PokemonEntity> _filterPokemonByType(List<PokemonEntity> pokemonList, PokemonCapturedFilter filter) {
    if (filter == PokemonCapturedFilter.all) {
      return pokemonList;
    } else {
      return pokemonList.where((pokemon) => pokemon.types.map((type) => type.name).contains(filter.name)).toList();
    }
  }

  List<PokemonEntity> _filterPokemonByOrder(
      List<PokemonEntity> pokemonList, PokemonCapturedOrder order) {
    switch (order) {
      case PokemonCapturedOrder.byId:
        return pokemonList..sort((a, b) => a.id.compareTo(b.id));
      case PokemonCapturedOrder.alphabeticallyAsc:
        return pokemonList..sort((a, b) => a.name.compareTo(b.name));
      case PokemonCapturedOrder.alphabeticallyDesc:
        return pokemonList..sort((a, b) => b.name.compareTo(a.name));
    }
  }
}

//Provider
final pokemonCapturedViewmodelProvider =
    NotifierProvider<PokemonCapturedViewmodel, PokemonCapturedState>(PokemonCapturedViewmodel.new);
