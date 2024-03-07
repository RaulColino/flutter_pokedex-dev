import 'package:flutter_pokedex/data/repositories/pokeapi_hive_pokemon_repository.dart';
import 'package:flutter_pokedex/domain/services/pokemon_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//Here we define the riverpod providers of services to use in the viemodels (with its repositories).
final Provider<PokemonService> pokemonServiceProvider = Provider((ref) {
  return PokemonService(PokeapiHivePokemonRepository());
});
