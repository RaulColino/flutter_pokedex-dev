import 'package:flutter_pokedex/domain/entities/app_exception.dart';
import 'package:flutter_pokedex/domain/entities/pokemon_entity.dart';
import 'package:oxidized/oxidized.dart';

abstract interface class IPokemonRepository {
  Future<Result<List<PokemonEntity>, AppException>> getPokemonList();
  Future<Result<List<PokemonEntity>, AppException>> getPokemonCaptured();
  //Future<String> getPokemonDetailsByName(String name);
}
