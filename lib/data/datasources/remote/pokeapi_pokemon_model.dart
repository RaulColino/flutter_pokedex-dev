import 'package:flutter_pokedex/domain/entities/pokemon_entity.dart';

class PokeapiPokemonModel extends PokemonEntity {

  PokeapiPokemonModel({
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
          types: types.map((type) => type.type).toList(),
        );

  factory PokeapiPokemonModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic> types = json['types'];
    final List<PokemonType> pokemonTypes = types
        .map((type) => PokemonType.fromJson(type))
        .toList();

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

class PokemonType {
  final String type;

  PokemonType({required this.type});

  factory PokemonType.fromJson(Map<String, dynamic> json) {
    return PokemonType(
      type: json['type']['name'],
    );
  }
}