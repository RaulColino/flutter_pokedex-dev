import 'package:flutter/material.dart';
import 'package:devest_ui/devest_ui.dart';

void main() {
  runApp(const Pokedex());
}

class Pokedex extends StatelessWidget {
  const Pokedex({super.key});

  static final _lightTheme = DvTheme(
    primary: Colors.blue,
    secondary: Colors.blueGrey[200],
    success: Colors.green,
    warning: Colors.yellow,
    error: Colors.red,
    info: Colors.blue,
    background: Colors.white,
    surface100: Colors.white,
    surface200: Colors.grey[100],
    textPrimary: Colors.black,
    textSecondary: const Color(0xFF808080),
    divider: Colors.grey[300],
    border: Colors.grey[300],
  );

  static final _darkTheme = DvTheme(
    primary: Colors.blue,
    secondary: Colors.blueGrey[700],
    success: Colors.green,
    warning: Colors.yellow,
    error: Colors.red,
    info: Colors.blue,
    background: Colors.black,
    surface100: Colors.grey[900],
    surface200: Colors.grey[800],
    textPrimary: Colors.white,
    textSecondary: Colors.grey,
    divider: Colors.grey[700],
    border: Colors.grey[700],
  );

  @override
  Widget build(BuildContext context) {
    return DevestUi(
      lightTheme: _lightTheme,
      darkTheme: _darkTheme,
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
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Pokédex Code Challenge'),
      ),
      body: const Center(
          child: Column(
        children: [
          ThemeSettings(),
          Text('Lee el README para comenzar'),
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
