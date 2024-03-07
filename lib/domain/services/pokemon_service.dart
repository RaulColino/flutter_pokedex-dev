import 'package:flutter_pokedex/data/repositories/pokemon_repository.dart';
import 'package:flutter_pokedex/domain/entities/app_exception.dart';
import 'package:flutter_pokedex/domain/entities/pokemon_entity.dart';
import 'package:oxidized/oxidized.dart';

class PokemonService {
  final PokemonRepository _pokemonRepository;

  PokemonService(this._pokemonRepository);

  //getPokemonList
  Future<Result<List<PokemonEntity>, AppException>> getPokemonList() async {
    return _pokemonRepository.getPokemonList();
  }

  //getPokemonDetailsByName
  // Future<Result<PokemonEntity, AppException>> getPokemonDetailsByName(String name) async {
  //   return _pokemonRepository.getPokemonDetailsByName(name);
  // }
}
