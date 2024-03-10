import 'package:devest_ui/devest_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokedex/presentation/screens/home/pokemon_list_page/pokemon_list_viewmodel.dart';
import 'package:flutter_pokedex/presentation/widgets/pokemon_grid_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PokemonListPage extends ConsumerWidget {
  const PokemonListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final PokemonListState viewmodel = ref.watch(pokemonListViewModelProvider);

    double width = MediaQuery.of(context).size.width;

    // viewmodel.pokemonList.whenData((list) {
    //   for (var pokemon in list) {
    //     precacheImage(CachedNetworkImageProvider(pokemon.imageUrl), context);
    //   }
    // });

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
            child: viewmodel.pokemonList.when(
              data: (pokemonList) => PokemonGridView(pokemonList: pokemonList),
              loading: () => Center(child: CircularProgressIndicator(color: DvColor.primary)),
              error: (error, stackTrace) => Center(
                child: DvText.bodyM(
                        "Error while trying to retrieve the data. Check your connection and try again.")
                    .styles(color: DvColor.error),
              ),
            ),
          ),
        ],
      ),
    );
  }
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
