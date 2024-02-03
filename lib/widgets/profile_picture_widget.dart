import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/others.dart';

import '../constants/colors.dart';
import '../models/models.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({
    super.key,
    required this.model,
    this.radius = 40,
    this.padding = 3,
    this.marginColor = backgroundColor,
  });

  final StoryModel model;
  final double radius;
  final double padding;
  final Color marginColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.all(padding),
          decoration: model.hasStories
              ? const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      Color(0xffd400c6),
                      Color(0xfffcc65a),
                    ],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                  ),
                )
              : null,
          child: Container(
            padding: EdgeInsets.all(padding),
            decoration: BoxDecoration(
              color: marginColor,
              shape: BoxShape.circle,
            ),
            child: model.profilePictureUrl == null
                ? CircleAvatar(
                    radius: radius,
                    backgroundColor: grey,
                    backgroundImage: const AssetImage(defaultProfilePicture),
                  )
                : CircleAvatar(
                    radius: radius,
                    backgroundColor: grey,
                    // backgroundImage: NetworkImage(model.profilePictureUrl!),
                    backgroundImage: NetworkImage(model.profilePictureUrl!),
                    child: CachedNetworkImage(
                      imageUrl: model.profilePictureUrl!,
                      placeholderFadeInDuration:
                          const Duration(milliseconds: 300),
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
          ),
        ),
        if (model.isMe)
          Positioned(
            bottom: 8,
            right: -2,
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: const BoxDecoration(
                color: backgroundColor,
                shape: BoxShape.circle,
              ),
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: const BoxDecoration(
                  color: lightBlue,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.add_rounded,
                  color: white,
                  size: 20,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
