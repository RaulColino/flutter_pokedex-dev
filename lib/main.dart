import 'package:flutter/material.dart';
import 'package:devest_ui/devest_ui.dart';
import 'package:flutter_pokedex/presentation/theme/app_theme.dart';
import 'package:flutter_pokedex/presentation/theme/icon_locations.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  runApp(const Pokedex());
}

class Pokedex extends StatelessWidget {
  const Pokedex({super.key});



  @override
  Widget build(BuildContext context) {
    return DevestUi(
      lightTheme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      child: MaterialApp(
        title: 'Pokédex Code Challenge',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DvColor.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: DvText.bodyM("Pokédex").styles(color: DvColor.textPrimary),
      ),
      body: Center(
          child: Column(
        children: [
          SvgPicture.asset(
            IconLocations.home,
            width: 30,
            height: 30,
            colorFilter: ColorFilter.mode(DvColor.textSecondary, BlendMode.srcIn),
          ),
          SvgPicture.asset(
            IconLocations.pokeball,
            width: 30,
            height: 30,
            colorFilter: ColorFilter.mode(DvColor.textSecondary, BlendMode.srcIn),
          ),
          const ThemeSettings(),
        
        ],
      )),
    );
  }
}

class ThemeSettings extends StatelessWidget {
  const ThemeSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DvText.displayXL("Theme Settings").styles(
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
