import 'package:flutter/material.dart';
import 'package:instagram_clone/widgets/widgets.dart';

import '../colors/colors.dart';
import '../models/models.dart';

class Story extends StatelessWidget {
  const Story({super.key, required this.model});

  final StoryModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
