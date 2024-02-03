import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/colors.dart';

import '../models/models.dart';

class SeachItem extends StatelessWidget {
  const SeachItem({
    super.key,
    this.height = 120,
    this.multiplier = 1,
    required this.photo,
  });

  final double height;
  final double multiplier;
  final Photos photo;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * multiplier,
      decoration: BoxDecoration(
        color: grey,
        border: Border.all(color: backgroundColor, width: 1),
      ),
      child: CachedNetworkImage(
        imageUrl: photo.src.tiny,
        placeholderFadeInDuration: const Duration(milliseconds: 500),
        fit: BoxFit.cover,
      ),
    );
  }
}
