import 'dart:convert';

import 'package:flutter_pokedex/data/datasources/local/hive_pokemon_model.dart';
import 'package:flutter_pokedex/domain/entities/app_exception.dart';
import 'package:flutter_pokedex/domain/entities/pokemon_entity.dart';
import 'package:hive/hive.dart';
import 'package:oxidized/oxidized.dart';

class HivePokemonCapturedDatasource {
  static const _box = "pokemon_captured";

  //Save a captured pokemon  as a serialized json string
  Future<Result<void, AppException>> saveCapturedPokemon(PokemonEntity pokemon) async {
    try {
      final box = await Hive.openBox(_box);
      box.put(pokemon.id, jsonEncode(HivePokemonModel.fromEntity(pokemon).toJson()));
      return const Ok(());
    } catch (e) {
      // print("Error: HivePokemonCapturedDatasource: savePokemonCaptured(): $e");
      return Err(AppException(type: AppExceptionType.database, msg: e.toString()));
    }
  }

  //Get all captured pokemon
  Future<Result<List<PokemonEntity>, AppException>> getCapturedPokemon() async {
    try {
      final box = await Hive.openBox(_box);
      final List<PokemonEntity> capturedPokemon =
          box.values.map((json) => HivePokemonModel.fromJson(jsonDecode(json)).toEntity()).toList();
      return Ok(capturedPokemon);
    } catch (e) {
      // print("Error: HivePokemonCapturedDatasource: getCapturedPokemon(): $e");
      return Err(AppException(type: AppExceptionType.database, msg: e.toString()));
    }
  }
}
