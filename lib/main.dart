import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pokedex/presentation/pokedex_app.dart';

void main() {
  //We must call the following method because we use await (inside  PokedexApp.initializeApp()) before calling runApp()
  WidgetsFlutterBinding.ensureInitialized();
  //We must await for app initialization logic before running the app
  PokedexApp.initializeApp();
  //status bar must show correct color as the light theme uses a white appbar and the status bar icons are white by default
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarBrightness: Brightness.light));
  //Finally run the app
  runApp(const PokedexApp());
}
