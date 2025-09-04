import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

/// Reusable widget for network images
/// Just pass the [imageUrl], [width], [height], and [fit] as needed
class CustomNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;

  const CustomNetworkImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      fit: fit,
      placeholder: (context, url) =>
          const Center(child: CircularProgressIndicator()), // loader
      errorWidget: (context, url, error) =>
          const Icon(Icons.error, color: Colors.red), // fallback if error
    );
  }
}


/*


CustomNetworkImage(
  imageUrl: "https://eduwise.com.bd/Frontend/assets/img/icon/guidline/bachelor.png",
  width: 120,
  height: 120,
  fit: BoxFit.contain,
),

CustomNetworkImage(
  imageUrl: "https://eduwise.com.bd/Frontend/assets/img/icon/guidline/bachelor.png",
),

CustomNetworkImage(
  imageUrl: "https://example.com/banner.png",
  width: double.infinity,
  height: 200,
  fit: BoxFit.cover,
),





*/