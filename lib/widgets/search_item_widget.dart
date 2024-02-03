import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/colors.dart';
import 'package:instagram_clone/constants/others.dart';
import 'package:instagram_clone/models/models.dart';
import 'package:instagram_clone/screens/screens.dart';

class SeachItem extends StatelessWidget {
  const SeachItem({
    super.key,
    this.height = 120,
    this.multiplier = 1,
    required this.url,
    required this.photo,
  });

  final double height;
  final double multiplier;
  final String url;
  final Photos photo;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ExploreScreen(
              model: ContentPostModel(
                storyModel: StoryModel(
                  username: photo.photographer,
                  profilePictureUrl: photo.src.medium,
                  isVerified: random.nextBool(),
                  hasStories: random.nextBool(),
                ),
                caption: wordGenerator.randomSentence(10),
                friendName: wordGenerator.randomName(),
                showLikes: random.nextBool(),
                totalLikes: random.nextInt(10000),
                totalComments: random.nextInt(500),
                createAt: DateTime.now(),
              ),
            ),
          ),
        );
      },
      child: Container(
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
          placeholderFadeInDuration: const Duration(milliseconds: 300),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
