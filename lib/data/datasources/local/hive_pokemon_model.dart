import 'package:equatable/equatable.dart';
import 'package:flutter_pokedex/domain/entities/pokemon_entity.dart';

class HivePokemonModel extends Equatable {
  final int id;
  final String name;
  final String imageUrl;
  final int height;
  final int weight;
  final List<String> types;

  const HivePokemonModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.height,
    required this.weight,
    required this.types,
  });

  factory HivePokemonModel.fromJson(Map<String, dynamic> json) {
    return HivePokemonModel(
      id: json['id'],
      name: json['name'],
      imageUrl: json['imageUrl'],
      height: json['height'],
      weight: json['weight'],
      types: List<String>.from(json['types']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'height': height,
      'weight': weight,
      'types': types,
    };
  }

  PokemonEntity toEntity() {
    return PokemonEntity(
      id: id,
      name: name,
      imageUrl: imageUrl,
      height: height,
      weight: weight,
      types: types,
    );
  }

  factory HivePokemonModel.fromEntity(PokemonEntity pokemon) {
    return HivePokemonModel(
      id: pokemon.id,
      name: pokemon.name,
      imageUrl: pokemon.imageUrl,
      height: pokemon.height,
      weight: pokemon.weight,
      types: pokemon.types,
    );
  }

  @override
  List<Object> get props => [id, name, imageUrl, height, weight, types];
}
