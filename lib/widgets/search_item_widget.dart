import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/colors.dart';

class SeachItem extends StatelessWidget {
  const SeachItem({
    super.key,
    this.height = 120,
    this.multiplier = 1,
    required this.url,
  });

  final double height;
  final double multiplier;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * multiplier,
      decoration: BoxDecoration(
        color: grey,
        border: Border.all(color: backgroundColor, width: .9),
      ),
      child: CachedNetworkImage(
        errorWidget: (_, __, ___) => Image.network(
          url,
          fit: BoxFit.cover,
        ),
        imageUrl: url,
        placeholderFadeInDuration: const Duration(milliseconds: 500),
        fit: BoxFit.cover,
      ),
    );
  }
}
