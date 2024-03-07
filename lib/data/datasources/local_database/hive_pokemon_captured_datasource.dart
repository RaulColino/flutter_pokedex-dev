

import 'dart:convert';

import 'package:flutter_pokedex/data/datasources/local/hive_pokemon_model.dart';
import 'package:flutter_pokedex/domain/entities/pokemon_entity.dart';
import 'package:hive/hive.dart';

class HivePokemonCapturedDatasource {

   static const _box = "pokemon_captured";

   //Save a pokemon captured as a serialized json string
    Future<void> savePokemonCaptured(PokemonEntity pokemon) async {
      final box = await Hive.openBox(_box);
      box.put(pokemon.id, jsonEncode(pokemon.toJson()));
    }


    

  // Future<Result<void, AppException>> saveCourses(List<Course> courses) async {
  //   try {
  //     final coursesBox = await Hive.openBox('coursesBox');
  //     coursesBox.put(
  //       COURSES,
  //       jsonEncode(courses.map((course) {
  //         final jsonCourse = course.toJson();
  //         print("HiveCourseLocalDatasource:::::::::::::::::: $jsonCourse");
  //         return jsonCourse;
  //       }).toList()),
  //     );
  //     return Ok(null);
  //   } catch (e) {
  //     print("Error: HiveCourseLocalDatasource: save(): $e");
  //     return Err(AppException(type: AppExceptionType.database));
  //   }
  // }

  //Get all captured pokemon
  Future<List<PokemonEntity>> getCapturedPokemon() async {
    final box = await Hive.openBox(_box);
    final List<PokemonEntity> capturedPokemon = [];
    for (var i = 0; i < box.length; i++) {
      final pokemon = jsonDecode(box.getAt(i).toString());
      capturedPokemon.add(HivePokemonModel.fromJson(pokemon));
    }
    return capturedPokemon;
  }





}