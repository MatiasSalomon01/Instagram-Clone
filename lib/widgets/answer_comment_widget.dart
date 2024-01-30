import 'dart:math';

import 'package:flutter/material.dart';
import 'package:instagram_clone/widgets/widgets.dart';

import '../constants/colors.dart';
import '../constants/icons.dart';
import '../models/models.dart';

class AnswerComment extends StatelessWidget {
  const AnswerComment({super.key, required this.model});
  final CommentModel model;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ProfilePicture(
            radius: 16,
            padding: 2,
            model: StoryModel(
              username: 'lol',
              hasStories: Random().nextBool(),
            ),
            marginColor: grey,
          ),
        ),
        const HorizontalSpace(5),
        Expanded(
          flex: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    model.username,
                    style: const TextStyle(
                      color: white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                  const HorizontalSpace(10),
                  Text(
                    '${model.days} d',
                    style: const TextStyle(
                      color: greyText,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              Text(
                model.caption,
                style: const TextStyle(
                  color: white,
                  fontSize: 12,
                ),
              ),
              const VerticalSpace(5),
              const Row(
                children: [
                  Text(
                    'Responder',
                    style: TextStyle(
                      color: greyText,
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                  ),
                  HorizontalSpace(20),
                  Text(
                    'Ver traduccion',
                    style: TextStyle(
                      color: greyText,
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const HorizontalSpace(8),
        SvgAnimatedIcon(
          svgIcon: favoriteIcon,
          svgIconPressed: favoriteIconSelected,
          isPressed: false,
          height: 18,
          svgColor: greyText,
          svgColorSelected: const Color(0xffff3040),
          addCounter: true,
          counter: model.countLikes,
          onTap: () {},
        ),
      ],
    );
  }
}
