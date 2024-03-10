import 'package:flutter/widgets.dart';

import 'package:flutter_pokedex/domain/entities/pokemon_entity.dart';
import 'package:flutter_pokedex/presentation/utils/routes/app_routes.dart';
import 'package:flutter_pokedex/presentation/widgets/pokemon_card.dart';
import 'package:go_router/go_router.dart';

class PokemonGridView extends StatelessWidget {
  const PokemonGridView({
    Key? key,
    required this.pokemonList,
  }) : super(key: key);

  final List<PokemonEntity> pokemonList;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      primary: false,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      children: <Widget>[
        ...pokemonList
            .map(
              (pokemon) => PokemonCard(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                imageUrl: pokemon.imageUrl,
                name: pokemon.name,
                id: pokemon.id,
                onTap: () => context.pushNamed(
                  AppRoutes.pokemonDetailPage.name,
                  extra: pokemon,
                ),
              ),
            )
            .toList(),
      ],
    );
  }
}
