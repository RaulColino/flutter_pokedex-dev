import 'package:flutter_pokedex/data/repositories/pokeapi_hive_pokemon_repository.dart';
import 'package:flutter_pokedex/domain/entities/app_exception.dart';
import 'package:flutter_pokedex/domain/entities/pokemon_entity.dart';
import 'package:oxidized/oxidized.dart';

class PokemonService {
  final PokeapiHivePokemonRepository _pokemonRepository;

  PokemonService(this._pokemonRepository);

  //getPokemonList
  Future<Result<List<PokemonEntity>, AppException>> getPokemonList() async {
    return _pokemonRepository.getPokemonList();
  }

  //getPokemonCaptured
  Future<Result<List<PokemonEntity>, AppException>> getPokemonCaptured() {
    return _pokemonRepository.getPokemonCaptured();
  }

  //getPokemonDetailsByName
  // Future<Result<PokemonEntity, AppException>> getPokemonDetailsByName(String name) async {
  //   return _pokemonRepository.getPokemonDetailsByName(name);
  // }
}
