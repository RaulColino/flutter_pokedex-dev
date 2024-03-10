import 'package:flutter_pokedex/domain/entities/pokemon_entity.dart';

class PokeapiPokemonModel extends PokemonEntity {
  const PokeapiPokemonModel({
    required int id,
    required String name,
    required int height,
    required int weight,
    required String imageUrl,
    required List<PokemonType> types,
  }) : super(
          id: id,
          name: name,
          height: height,
          weight: weight,
          imageUrl: imageUrl,
          types: types,
        );

  factory PokeapiPokemonModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic> types = json['types'];
    final List<PokemonType> pokemonTypes = types.map((type) => PokemonType.values.firstWhere((enumValue) => enumValue.name == type['type']['name'])).toList();

    return PokeapiPokemonModel(
      id: json['id'],
      name: json['name'],
      height: json['height'],
      weight: json['weight'],
      imageUrl: json['sprites']['other']['official-artwork']['front_default'],
      types: pokemonTypes,
    );
  }
}
