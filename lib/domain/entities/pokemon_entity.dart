// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class PokemonEntity extends Equatable {
  final int id;
  final String name;
  final String imageUrl;
  final int height;
  final int weight;
  final List<PokemonType> types;
  final bool isCaptured;

  const PokemonEntity({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.height,
    required this.weight,
    required this.types,
    this.isCaptured = false,
  });

  PokemonEntity copyWith({
    int? id,
    String? name,
    String? imageUrl,
    int? height,
    int? weight,
    List<PokemonType>? types,
    bool? isCaptured,
  }) {
    return PokemonEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      types: types ?? this.types,
      isCaptured: isCaptured ?? this.isCaptured,
    );
  }

  @override
  List<Object> get props {
    return [
      id,
      name,
      imageUrl,
      height,
      weight,
      types,
      isCaptured,
    ];
  }

  @override
  bool get stringify => true;
}

enum PokemonType {
  bug,
  dark,
  dragon,
  electric,
  fairy,
  fighting,
  fire,
  flying,
  ghost,
  grass,
  ground,
  ice,
  normal,
  poison,
  psychic,
  rock,
  steel,
  water;

  String toJson() => name;
  static PokemonType fromJson(String json) => values.firstWhere((element) => element.name == json);
}
