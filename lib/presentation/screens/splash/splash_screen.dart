import 'package:devest_ui/devest_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_pokedex/presentation/utils/routes/app_routes.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DvColor.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: DvText.bodyM('Flutter Pokédex')
                  .animate(onComplete: (_) => context.goNamed(AppRoutes.homeScreen.name))
                  .fadeIn(duration: 1000.ms, curve: Curves.easeInOut)
                  .then()
                  .fadeOut(duration: 1000.ms, curve: Curves.easeInOut),
            ),
             SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                color: DvColor.primary,
                strokeWidth: 1,
              ),
            )
          ],
        ),
      ),
    );
  }
}
