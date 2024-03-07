
//join data and return all pokemon

import 'package:flutter_pokedex/data/datasources/local_database/hive_pokemon_captured_datasource.dart';
import 'package:flutter_pokedex/data/datasources/pokeapi/pokeapi_pokemon_datasource.dart';

class PokemonRepository {
  final PokeapiDatasource apiDatasource;
  final HivePokemonCapturedDatasource pokemonCapturedDatasource;

  PokemonRepository({required this.pokeapiDatasource, required this.localDbDatasource});

  // Future<String> getPokemonDetailsByName(string name) async {
  //   return await pokeapiDatasource.getPokemonDetailsByName(name);
  // }

  // //Get all pokemon
  // Future<String> getPokemonList() async {
  //   return await pokeapiDatasource.getPokemonList();
  // }

  // //Get captured pokemon
  // Future<String> getCaptured(String name) async {
  //   return await localDbDatasource.getCapturedPokemon();
  // }
  
}