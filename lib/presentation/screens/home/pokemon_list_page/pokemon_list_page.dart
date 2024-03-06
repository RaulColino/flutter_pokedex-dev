import 'package:devest_ui/devest_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PokemonListPage extends ConsumerWidget {
  const PokemonListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        backgroundColor: DvColor.background,
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                ThemeSettings(),
                DvText.bodyM("Pokemon List Page").styles(
                  color: DvColor.textPrimary,
                ),
              ],
            ),
          ),
        ));
  }
}

class ThemeSettings extends StatelessWidget {
  const ThemeSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DvText.bodyM("Theme Settings").styles(
          color: DvColor.textPrimary,
        ),
        Row(
          children: [
            ElevatedButton(
              child: DvText.bodyM("Light Theme"),
              onPressed: () {
                DevestUi.setLightTheme();
              },
            ),
            ElevatedButton(
              child: DvText.bodyM("Dark Theme"),
              onPressed: () {
                DevestUi.setDarkTheme();
              },
            ),
          ],
        ),
      ],
    );
  }
}
