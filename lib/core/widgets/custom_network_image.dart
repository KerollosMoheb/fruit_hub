import 'package:flutter/material.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({
    super.key,
    required this.imageUrl,
    this.fit = BoxFit.cover,
  });

  final String imageUrl;
  final BoxFit fit;

  bool _isNetworkUrl(String url) {
    return url.startsWith('http') || url.startsWith('https');
  }

  @override
  Widget build(BuildContext context) {
    if (_isNetworkUrl(imageUrl)) {
      return Image.network(
        imageUrl,
        fit: fit,
        errorBuilder:
            (context, error, stackTrace) => const Icon(Icons.broken_image),
      );
    } else {
      return Image.asset(
        imageUrl,
        fit: fit,
        errorBuilder:
            (context, error, stackTrace) => const Icon(Icons.broken_image),
      );
    }
  }
}
