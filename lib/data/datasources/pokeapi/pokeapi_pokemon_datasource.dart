import 'dart:convert';
import 'dart:io';

import 'package:flutter_pokedex/data/models/pokeapi/pokeapi_pokemon_model.dart';
import 'package:flutter_pokedex/domain/entities/app_exception.dart';
import 'package:flutter_pokedex/domain/entities/pokemon_entity.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:oxidized/oxidized.dart';

class PokeapiDatasource {
  //getPokemonList
  Future<Result<List<PokemonEntity>, AppException>> getPokemonList() async {
    try {
      final Response res =
          await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/?limit=151&offset=0'));
      if (res.statusCode == 200) {
        final List<dynamic> list = jsonDecode(res.body)['results'];
        final List<PokemonEntity> pokemonList =
            list.map((pokemon) => PokeapiPokemonModel.fromJson(pokemon)).toList();
        return Ok(pokemonList);
      } else {
        return Err(AppException(
            type: AppExceptionType.api, msg: 'Error getting pokemon list data: ${res.statusCode}'));
      }
    } on SocketException catch (e) {
      return Err(AppException(type: AppExceptionType.network, msg: e.message)); //no internet error
    } on Exception catch (e) {
      return Err(AppException(type: AppExceptionType.api, msg: e.toString())); //unknown error
    }
  }

  //getPokemonDetailsByName
  Future<Result<PokemonEntity, AppException>> getPokemonDetailsByName(String name) async {
    try {
      final Response res = await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/$name/'));
      if (res.statusCode == 200) {
        final model = PokeapiPokemonModel.fromJson(jsonDecode(res.body));
        return Ok(model);
      } else {
        return Err(AppException(
            type: AppExceptionType.api,
            msg: 'Error getting pokemon details data: ${res.statusCode}'));
      }
    } on SocketException catch (e) {
      return Err(AppException(type: AppExceptionType.network, msg: e.message)); //no internet error
    } on Exception catch (e) {
      return Err(AppException(type: AppExceptionType.api, msg: e.toString())); //unknown error
    }
  }

  //Sprite from official-artwork
  Future<Result<String, AppException>> getPokemonSpriteById(int id) async {
    try {
      final Response res = await http.get(Uri.parse(
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png'));
      if (res.statusCode == 200) {
        return Ok(res.body);
      } else {
        return Err(AppException(
            type: AppExceptionType.api,
            msg: 'Error getting pokemon sprite data: ${res.statusCode}'));
      }
    } on SocketException catch (e) {
      return Err(AppException(type: AppExceptionType.network, msg: e.message)); //no internet error
    } on Exception catch (e) {
      return Err(AppException(type: AppExceptionType.api, msg: e.toString())); //unknown error
    }
  }

  //getPokemonDetailsById
  // Future<Result<PokemonEntity, AppException>> getPokemonDetailsById(int id) async {
  //   try {
  //     final Response res = await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/$id/'));
  //     if (res.statusCode == 200) {
  //       final model = PokeapiPokemonModel.fromJson(jsonDecode(res.body));
  //       return Ok(model);
  //     } else {
  //       return Err(AppException(
  //           type: AppExceptionType.api,
  //           msg: 'Error getting pokemon details data: ${res.statusCode}'));
  //     }
  //   } on SocketException catch (e) {
  //     return Err(AppException(type: AppExceptionType.network, msg: e.message)); //no internet error
  //   } on Exception catch (e) {
  //     return Err(AppException(type: AppExceptionType.api, msg: e.toString())); //unknown error
  //   }
  // }
}
