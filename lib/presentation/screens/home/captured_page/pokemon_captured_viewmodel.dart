// ignore_for_file: public_member_api_docs, sort_constructors_first
//var inputText = _searchController.text;
//var filteredPokemonCaptured = pokemon_captured.where((pok) => pok.name.toLowerCase().contains(inputText.toLowerCase())).toList();

//La lista de Pokémon capturados debe aparecer ordenada por su id.
//Posibilidad de filtrar por tipo
//y a ordenarlos alfabéticamente.
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_pokedex/domain/entities/pokemon_entity.dart';

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
  final List<PokemonEntity> _pokemonCaptured;
  final List<PokemonEntity> filteredPokemonCaptured;
  final PokemonCapturedOrder order;
  final PokemonCapturedFilter filter;

  PokemonCapturedState({
    required List<PokemonEntity> pokemonCaptured,
    required this.filteredPokemonCaptured,
    required this.order,
    required this.filter,
  }) : _pokemonCaptured = pokemonCaptured;


  PokemonCapturedState copyWith({
    List<PokemonEntity>? pokemonCaptured,
    List<PokemonEntity>? filteredPokemonCaptured,
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

//Viewmodel
class PokemonCapturedViewmodel extends Notifier<PokemonCapturedState> {
  @override
  PokemonCapturedState build() {
    return PokemonCapturedState(
      pokemonCaptured: <PokemonEntity>[
        PokemonEntity(
            id: 1,
            name: "Zubat",
            types: [PokemonType.bug, PokemonType.dragon],
            isCaptured: true,
            imageUrl:
                "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${3}.png",
            height: 10,
            weight: 10),
        PokemonEntity(
            id: 12,
            name: "Arbok",
            types: [PokemonType.bug, PokemonType.dragon],
            isCaptured: true,
            imageUrl:
                "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${23}.png",
            height: 10,
            weight: 10),
        PokemonEntity(
            id: 23,
            name: "Ekans",
            types: [PokemonType.electric, PokemonType.poison],
            isCaptured: true,
            imageUrl:
                "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${43}.png",
            height: 10,
            weight: 10),
      ],
      filteredPokemonCaptured: <PokemonEntity>[
        PokemonEntity(
            id: 1,
            name: "Zubat",
            types: [PokemonType.bug, PokemonType.dragon],
            isCaptured: true,
            imageUrl:
                "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${3}.png",
            height: 10,
            weight: 10),
        PokemonEntity(
            id: 12,
            name: "Arbok",
            types: [PokemonType.bug, PokemonType.dragon],
            isCaptured: true,
            imageUrl:
                "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${23}.png",
            height: 10,
            weight: 10),
        PokemonEntity(
            id: 23,
            name: "Ekans",
            types: [PokemonType.electric, PokemonType.poison],
            isCaptured: true,
            imageUrl:
                "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${43}.png",
            height: 10,
            weight: 10),
      ],
      order: PokemonCapturedOrder.byId,
      filter: PokemonCapturedFilter.all,
    );

    // final pokemonList = ref.read(pokemonListPageViewModelProvider);
    // final res = pokemonList.when(
    //   data: (pokemonList) {
    //     return PokemonCapturedState(
    //       pokemonCaptured: AsyncData(pokemonList.where((pokemon) => pokemon.isCaptured).toList()),
    //       order: PokemonCapturedOrder.byId,
    //       filter: PokemonCapturedFilter.all,
    //     );
    //   },
    //   loading: () {
    //     return PokemonCapturedState(
    //       pokemonCaptured: const AsyncLoading(),
    //       order: PokemonCapturedOrder.byId,
    //       filter: PokemonCapturedFilter.all,
    //     );
    //   },
    //   error: (error, stackTrace) {
    //     return PokemonCapturedState(
    //       pokemonCaptured: AsyncError(error, stackTrace),
    //       order: PokemonCapturedOrder.byId,
    //       filter: PokemonCapturedFilter.all,
    //     );
    //   },
    // );
    // return res;
  }

  // void addPokemon(PokemonEntity pokemon) {
  //   state = state.copyWith(pokemonCaptured: state.pokemonCaptured..add(pokemon));
  // }

  // void removePokemon(PokemonEntity pokemon) {
  //   state = state.copyWith(pokemonCaptured: state.pokemonCaptured..remove(pokemon));
  // }

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
