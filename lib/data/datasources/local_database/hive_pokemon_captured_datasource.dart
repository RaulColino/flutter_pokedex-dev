

import 'package:hive/hive.dart';

class HivePokemonCapturedDatasource {

   static const _box = "pokemon_captured";

   //Save a pokemon captured
    Future<void> savePokemonCaptured(int id) async {
      var box = await Hive.openBox<int>(_box);
      await box.put(id, id);
    }

    //Get all pokemon captured
    Future<List<int>> getAllPokemonCaptured() async {
      var box = await Hive.openBox<int>(_box);
      return box.values.toList();
    }

}