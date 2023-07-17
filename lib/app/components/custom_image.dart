import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  final String? path;
  final BoxFit? fit;
  const CustomImage({super.key, this.path, this.fit = BoxFit.cover});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: path ?? '',
      fit: fit,
      placeholder: (context, url) => Center(
        child: ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 60),
            child: const CircularProgressIndicator.adaptive()),
      ),
      errorWidget: (context, url, error) => const Icon(
          Icons.image_not_supported_rounded,
          color: Colors.grey,
          size: 48),
    );
  }
}
