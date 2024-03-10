import "package:flutter/material.dart";
import "package:flutter_pokedex/domain/entities/pokemon_entity.dart";
import "package:flutter_pokedex/presentation/screens/home/home_screen.dart";
import "package:flutter_pokedex/presentation/screens/pokemon_detail/pokemon_detail_screen.dart";
import "package:flutter_pokedex/presentation/screens/splash/splash_screen.dart";
import "package:go_router/go_router.dart";

//Careful GoRouter will look up the route by name in a case-insensitive way so don't put Upercase letters because it won't work
enum AppRoutes {
  splashScreen,
  homeScreen,
  pokemonListPage,
  pokemonDetailPage,
}

class AppRouter {
  static GoRouter routes = GoRouter(
    initialLocation: "/splash",
    routes: [
      GoRoute(
        name: AppRoutes.splashScreen.name,
        path: "/splash",
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        name: AppRoutes.homeScreen.name,
        path: "/",
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: HomeScreen(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        name: AppRoutes.pokemonDetailPage.name,
        path: "/pokemon-detail",
        builder: (context, state) => PokemonDetailScreen(
          pokemon: state.extra as PokemonEntity,
        ),
      ),
    ],
  );
}
