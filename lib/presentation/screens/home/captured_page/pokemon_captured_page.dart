import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PokemonCapturedPage extends ConsumerWidget {
  const PokemonCapturedPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text("Pokemon Captured Page"),
          ],
        ),
      )
    );
  }
}