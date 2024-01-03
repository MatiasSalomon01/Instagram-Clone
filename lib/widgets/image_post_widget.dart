import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/others.dart';

class ImagePost extends StatelessWidget {
  const ImagePost({
    super.key,
    this.url,
  });

  final String? url;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Image.network(
      url ?? defaultProfilePicture,
      fit: BoxFit.cover,
      width: size.width,
    );
  }
}
