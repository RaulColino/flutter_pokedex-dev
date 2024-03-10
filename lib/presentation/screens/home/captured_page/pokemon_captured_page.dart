import 'package:flutter/material.dart';
import 'package:flutter_pokedex/presentation/screens/home/captured_page/pokemon_captured_viewmodel.dart';
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
            child: ListView.builder(
              itemCount: viewmodel.filteredPokemonCaptured.length,
              itemBuilder: (context, index) {
                final pokemon = viewmodel.filteredPokemonCaptured[index];
                return ListTile(
                  title: Text(pokemon.name+" - id:"+pokemon.id.toString()),
                  subtitle: Text(pokemon.types.join(", ")),
                  trailing: null,
                );
              },
            ),
          ),
        ],
      ),
    ));
  }
}
