import 'package:cached_network_image/cached_network_image.dart';
import 'package:devest_ui/devest_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokedex/presentation/widgets/cached_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PokemonCard extends ConsumerWidget {
  const PokemonCard({
    super.key,
    required this.width,
    required this.height,
    required this.imageUrl,
    required this.name,
    required this.id,
    required this.onTap,
  });

  final double width;
  final double height;
  final String imageUrl;
  final String name;
  final int id;
  final void Function() onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //precacheImage(CachedNetworkImageProvider(imageUrl), context);
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(width * 0.023),
            child: Container(
              height: height,
              width: width,
              color: DvColor.secondary,
              child: Hero(
                tag: imageUrl,
                child: CachedImage(imageUrl: imageUrl),
                //     Image.network(
                //   imageUrl,
                //   loadingBuilder: (context, child, loadingProgress) {
                //     if (loadingProgress == null) {
                //       return child;
                //     }
                //     return Center(
                //       child: CircularProgressIndicator(
                //         color: DvColor.textPrimary,
                //       ),
                //     );
                //   },
                //   fit: BoxFit.cover,
                // ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "#$id $name",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: DvColor.textPrimary,
                    shadows: [
                      BoxShadow(
                        offset: const Offset(0, 1),
                        blurRadius: 19,
                        color: Theme.of(context).shadowColor.withOpacity(0.8),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
