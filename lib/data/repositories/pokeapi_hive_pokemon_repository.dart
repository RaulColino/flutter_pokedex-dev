import 'package:flutter_pokedex/data/datasources/local/hive_pokemon_captured_datasource.dart';
import 'package:flutter_pokedex/data/datasources/remote/pokeapi_pokemon_datasource.dart';
import 'package:flutter_pokedex/domain/entities/app_exception.dart';
import 'package:flutter_pokedex/domain/entities/pokemon_entity.dart';
import 'package:flutter_pokedex/domain/repository_interfaces/i_pokemon_repository.dart';
import 'package:oxidized/oxidized.dart';
import 'package:http/http.dart' as http;

class PokeapiHivePokemonRepository implements IPokemonRepository {
  final PokeapiDatasource pokemonDatasource = PokeapiDatasource(httpClient: http.Client());
  final HivePokemonCapturedDatasource capturedDatasource = HivePokemonCapturedDatasource();

  //getPokemonList
  @override
  Future<Result<List<PokemonEntity>, AppException>> getPokemonList() async {
    final result = await pokemonDatasource.getPokemonList();
    final List<(String, String)> list = result.unwrap();

    final List<Future<PokemonEntity>> futureList = list.map((elem) async {
      final pokemon = await pokemonDatasource.getPokemonDetailsByName(elem.$1);
      return pokemon.unwrap();
    }).toList();

    final List<PokemonEntity> pokemonList = await Future.wait(futureList);
    return Ok(pokemonList);
  }

  //getPokemonCaptured
  @override
  Future<Result<List<PokemonEntity>, AppException>> getPokemonCaptured() {
    return capturedDatasource.getCapturedPokemon();
  }
}
