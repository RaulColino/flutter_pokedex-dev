import 'package:devest_ui/devest_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokedex/presentation/screens/home/captured_page/pokemon_captured_viewmodel.dart';
import 'package:flutter_pokedex/presentation/widgets/pokemon_grid_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PokemonCapturedPage extends ConsumerWidget {
  const PokemonCapturedPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewmodel = ref.watch(pokemonCapturedViewmodelProvider);
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          const Text("Pokemon Captured Page"),
          const Row(
            children: [],
          ),
          DropdownButtonFormField<PokemonCapturedOrder>(
            value: viewmodel.order,
            onChanged: (PokemonCapturedOrder? order) {
              ref.read(pokemonCapturedViewmodelProvider.notifier).changeOrder(order!);
            },
            items: PokemonCapturedOrder.values
                .map((enumValue) => DropdownMenuItem(
                      value: enumValue,
                      child: Container(
                        child: () {
                          switch (enumValue) {
                            case PokemonCapturedOrder.byId:
                              return const Text("by id");
                            case PokemonCapturedOrder.alphabeticallyAsc:
                              return const Text("alphabetically asc");
                            case PokemonCapturedOrder.alphabeticallyDesc:
                              return const Text("alphabetically desc");
                          }
                        }(),
                      ),
                    ))
                .toList(),
            decoration: const InputDecoration(
              border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
            ),
          ),
          DropdownButtonFormField<PokemonCapturedFilter>(
            value: viewmodel.filter,
            onChanged: (PokemonCapturedFilter? filter) {
              ref.read(pokemonCapturedViewmodelProvider.notifier).changeFilter(filter!);
            },
            items: PokemonCapturedFilter.values
                .map((enumValue) => DropdownMenuItem(
                      value: enumValue,
                      child: Text(enumValue.toString().split('.').last),
                    ))
                .toList(),
            decoration: const InputDecoration(
              border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
            ),
          ),
          Expanded(
           
           child: viewmodel.filteredPokemonCaptured.when(
              data: (pokemonList) {
                return PokemonGridView(pokemonList: pokemonList);
              },
              loading: () {
                return Center(
                  child: CircularProgressIndicator(color: DvColor.primary),
                );
              },
              error: (error, stackTrace) {
                 return Center(
                  child: DvText.bodyM("Error while trying to retrieve the data. Check your connection and try again.").styles(
                    color: DvColor.error,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    ));
  }
}