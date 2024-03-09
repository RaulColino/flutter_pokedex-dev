import 'package:devest_ui/devest_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokedex/domain/entities/pokemon_entity.dart';
import 'package:flutter_pokedex/presentation/screens/home/pokemon_list_page/pokemon_list_page_viewmodel.dart';
import 'package:flutter_pokedex/presentation/widgets/pokemon_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PokemonListPage extends ConsumerWidget {
  const PokemonListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    final AsyncValue<List<PokemonEntity>> pokemonListAsyncValue = ref.watch(pokemonListPageViewModelProvider);
    
    double width = MediaQuery.of(context).size.width;
    

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //Title
          DvText.displayL("Pokemon List").styles(
            color: DvColor.textPrimary,
          ),

          const SizedBox(height: 15),

          //Subtitle
          DvText.bodyM("Select a Pokemon to see more details").styles(
            color: DvColor.textPrimary,
          ),

          //Grid
          Expanded(
            child: pokemonListAsyncValue.when(
              data: (pokemonList) {
                return buildCategoriesGridView(context, pokemonList);
              },
              loading: () {
                return Center(
                  child: CircularProgressIndicator(color: DvColor.primary),
                );
              },
              error: (error, stackTrace) {
                return Center(
                  child: DvText.captionM("Error while trying to retrieve the data. Check your connection and try again.").styles(
                    color: DvColor.error,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildCategoriesGridView(BuildContext context, List<PokemonEntity> pokemonList) {
  // Map<String, String> pokemonList = {
  //   "Bulbasaur": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png",
  //   "Ivysaur": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/2.png",
  //   "Venusaur": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/3.png",
  //   "Charmander": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/4.png",
  //   "Charmeleon": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/5.png",
  //   "Charizard": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/6.png",
  //   "Squirtle": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/7.png",
  //   "Wartortle": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/8.png",
  //   "Blastoise": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/9.png",
  // };

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
            (e) => PokemonCard(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              imageUrl: e.imageUrl,
              name: e.name,
              id: e.id,
              onTap: () => print("Clicked on ${e.name}"),
            ),
          )
          .toList(),
    ],
  );
}

















// class ThemeSettings extends StatelessWidget {
//   const ThemeSettings({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         DvText.bodyM("Theme Settings").styles(
//           color: DvColor.textPrimary,
//         ),
//         Row(
//           children: [
//             ElevatedButton(
//               child: DvText.bodyM("Light Theme"),
//               onPressed: () {
//                 DevestUi.setLightTheme();
//               },
//             ),
//             ElevatedButton(
//               child: DvText.bodyM("Dark Theme"),
//               onPressed: () {
//                 DevestUi.setDarkTheme();
//               },
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }
