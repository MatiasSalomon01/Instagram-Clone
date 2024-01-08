import 'package:flutter/material.dart';
import 'package:instagram_clone/widgets/widgets.dart';

import '../constants/colors.dart';
import '../constants/icons.dart';
import '../models/models.dart';

class AnswerComment extends StatelessWidget {
  const AnswerComment({super.key});

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
              hasStories: true,
            ),
            marginColor: grey,
          ),
        ),
        const Expanded(
          flex: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'username',
                    style: TextStyle(
                      color: white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  HorizontalSpace(10),
                  Text(
                    '3 d',
                    style: TextStyle(
                      color: greyText,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Text(
                'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb',
                style: TextStyle(color: white),
              ),
              VerticalSpace(5),
              Row(
                children: [
                  Text(
                    'Responder',
                    style: TextStyle(
                      color: greyText,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  HorizontalSpace(20),
                  Text(
                    'Ver traduccion',
                    style: TextStyle(
                      color: greyText,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SvgAnimatedIcon(
          svgIcon: favoriteIcon,
          svgIconPressed: favoriteIconSelected,
          isPressed: false,
          height: 18,
          svgColor: greyText,
          svgColorSelected: Color(0xffff3040),
          addCounter: true,
          counter: 10,
        ),
      ],
    );
  }
}
