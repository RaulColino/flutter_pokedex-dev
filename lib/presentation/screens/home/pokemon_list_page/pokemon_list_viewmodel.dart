import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_pokedex/domain/entities/pokemon_entity.dart';
import 'package:flutter_pokedex/domain/services/pokemon_service.dart';
import 'package:flutter_pokedex/presentation/utils/di/app_services.dart';

//State
class PokemonListState {
  final AsyncValue<List<PokemonEntity>> pokemonList;

  PokemonListState({required this.pokemonList});
}

//Viewmodel
class PokemonListViewModel extends Notifier<PokemonListState> {
  @override
  PokemonListState build() {
    final pokemonList = ref.watch(_pokemonListProvider);
    return PokemonListState(pokemonList: pokemonList);
  }
}

//PokemonProvider
final _pokemonListProvider = FutureProvider<List<PokemonEntity>>((ref) async {
  final PokemonService pokemonService = ref.read(AppServices.pokemonServiceProvider);
  final result = await pokemonService.getPokemonList();
  return result.unwrap();
});

//Provider
final pokemonListViewModelProvider =
    NotifierProvider<PokemonListViewModel, PokemonListState>(PokemonListViewModel.new);
