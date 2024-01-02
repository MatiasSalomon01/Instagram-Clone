import 'package:flutter/material.dart';

import '../colors/colors.dart';
import '../models/models.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({
    super.key,
    required this.model,
    this.radius = 40,
    this.padding = 3,
  });

  final StoryModel model;
  final double radius;
  final double padding;

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
            decoration: const BoxDecoration(
              color: backgroundColor,
              shape: BoxShape.circle,
            ),
            child: CircleAvatar(
              radius: radius,
              backgroundColor: white,
              backgroundImage: const NetworkImage(
                'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2c/Default_pfp.svg/340px-Default_pfp.svg.png',
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
