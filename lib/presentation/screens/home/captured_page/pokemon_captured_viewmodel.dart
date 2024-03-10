import 'package:flutter_pokedex/presentation/utils/di/app_services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_pokedex/domain/entities/pokemon_entity.dart';
import 'package:oxidized/oxidized.dart';

//Viewmodel
class PokemonCapturedViewmodel extends Notifier<PokemonCapturedState> {
  @override
  PokemonCapturedState build() {
    final pokemonCaptured = ref.watch(_pokemonCapturedPrivateProvider);
    return PokemonCapturedState(
      pokemonCaptured: pokemonCaptured,
      filteredPokemonCaptured: pokemonCaptured,
      order: PokemonCapturedOrder.byId,
      filter: PokemonCapturedFilter.all,
    );
  }

  void addPokemon(PokemonEntity pokemon) {
    state = state.copyWith(
      pokemonCaptured: state._pokemonCaptured.whenData(
        (value) => value..add(pokemon),
      ),
    );
  }

  void removePokemon(PokemonEntity pokemon) {
    state = state.copyWith(
      pokemonCaptured: state._pokemonCaptured.whenData(
        (value) => value..remove(pokemon),
      ),
    );
  }

  void changeOrder(PokemonCapturedOrder order) {
    state._pokemonCaptured.whenData((value) {
      final pokemonOrdered = _filterPokemonByOrder(value, order);
      state = state.copyWith(filteredPokemonCaptured: AsyncData(pokemonOrdered), order: order);
    });
  }

  void changeFilter(PokemonCapturedFilter filter) {
    state._pokemonCaptured.whenData((value) {
      final pokemonFiltered = _filterPokemonByType(value, filter);
      state = state.copyWith(filteredPokemonCaptured: AsyncData(pokemonFiltered), filter: filter);
    });
  }

  List<PokemonEntity> _filterPokemonByType(
      List<PokemonEntity> pokemonList, PokemonCapturedFilter filter) {
    if (filter == PokemonCapturedFilter.all) {
      return pokemonList;
    } else {
      return pokemonList
          .where((pokemon) => pokemon.types.map((type) => type.name).contains(filter.name))
          .toList();
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

//PokemonCapturedPrivateProvider
final _pokemonCapturedPrivateProvider = FutureProvider<List<PokemonEntity>>((ref) async {
  final pokemonService = ref.watch(AppServices.pokemonServiceProvider);
  final res = pokemonService.getPokemonCaptured();
  return res.unwrap();
});

//State
class PokemonCapturedState {
  final AsyncValue<List<PokemonEntity>> _pokemonCaptured;
  final AsyncValue<List<PokemonEntity>> filteredPokemonCaptured;
  final PokemonCapturedOrder order;
  final PokemonCapturedFilter filter;

  PokemonCapturedState({
    required AsyncValue<List<PokemonEntity>> pokemonCaptured,
    required this.filteredPokemonCaptured,
    required this.order,
    required this.filter,
  }) : _pokemonCaptured = pokemonCaptured;

  PokemonCapturedState copyWith({
    AsyncValue<List<PokemonEntity>>? pokemonCaptured,
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

//Enums
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

//Provider
final pokemonCapturedViewmodelProvider =
    NotifierProvider<PokemonCapturedViewmodel, PokemonCapturedState>(
  PokemonCapturedViewmodel.new,
);
