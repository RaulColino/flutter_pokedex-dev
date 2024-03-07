import 'package:flutter/material.dart';
import 'package:flutter_pokedex/presentation/pokedex_app.dart';

void main() {
  //We must call the following method because we use await (inside  MeditamosApp.initializeApp()) before calling runApp()
  WidgetsFlutterBinding.ensureInitialized();
  //We must await for app initialization logic before running the app
  PokedexApp.initializeApp();
  //Finally run the app
  runApp(const PokedexApp());
}
