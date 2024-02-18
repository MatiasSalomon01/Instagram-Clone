import 'package:flutter/material.dart';
import 'package:instagram_clone/widgets/widgets.dart';

import '../constants/colors.dart';
import '../models/models.dart';

class Story extends StatelessWidget {
  const Story({
    super.key,
    required this.index,
    required this.model,
  });

  final int index;
  final StoryModel model;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (model.hasStories && model.stories.isNotEmpty) {
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) {
                return StoryBuilder(index: index);
                // return StoryScreen(model: model);
              },
            ),
          );
        }
      },
      child: Container(
        constraints: const BoxConstraints(maxWidth: 87),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ProfilePicture(model: model),
            const VerticalSpace(5),
            Text(
              model.username,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: const TextStyle(color: white),
            ),
          ],
        ),
      ),
    );
  }
}
