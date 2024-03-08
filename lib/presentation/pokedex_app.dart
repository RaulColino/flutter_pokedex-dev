import 'package:devest_ui/devest_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokedex/presentation/utils/routes/app_routes.dart';
import 'package:flutter_pokedex/presentation/utils/theme/app_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class PokedexApp extends StatelessWidget {
  const PokedexApp({super.key});

  @override
  Widget build(BuildContext context) {
    //Wrap the app with ProviderScope to make accesible riverpod providers to the app
    //ProviderScope is a widget that stores the state of all the providers we create
    return const ProviderScope(
      child: PokedexMaterialApp(),
    );
  }

  //Initialization logic. Here we put the logic that must be called in main.dart before running the app.
  static Future<void> initializeApp() async {
    //Initialize Hive database
    final documentsDirectory = await path_provider.getApplicationDocumentsDirectory();
    Hive.init(documentsDirectory.path);
  }
}

//Consumer Widget lets you listen to Riverpod providers
class PokedexMaterialApp extends ConsumerWidget {
  const PokedexMaterialApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final DvTheme theme = ref.watch(appThemeProvider);

    return DevestUi(
      lightTheme: theme,
      darkTheme: theme,
      child: MaterialApp.router(
        title: 'Pokédex Code Challenge',
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.routes,
      ),
    );
  }
}