import 'package:flutter/material.dart';
import 'package:instagram_clone/widgets/widgets.dart';

import '../constants/colors.dart';
import '../constants/icons.dart';
import '../models/models.dart';

class Comment extends StatelessWidget {
  const Comment({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfilePicture(
                radius: 16,
                padding: 2,
                model: StoryModel(
                  username: 'lol',
                  hasStories: false,
                ),
              ),
              HorizontalSpace(10),
              Column(
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
                  SizedBox(
                    width: 280,
                    child: Text(
                      'And every time, we said, "Damn, this feels high end compared to the cartoon"',
                      style: TextStyle(color: white),
                    ),
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
                  VerticalSpace(12),
                  Row(
                    children: [
                      CustomDivider(
                        width: 45,
                        color: greyText,
                      ),
                      HorizontalSpace(15),
                      Text(
                        'Ver 7 respuestas',
                        style: TextStyle(
                          color: greyText,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SvgAnimatedIcon(
            svgIcon: favoriteIcon,
            svgIconPressed: favoriteIconSelected,
            isPressed: false,
            height: 18,
            svgColor: const Color(0xffff3040),
            addCounter: true,
            counter: 156,
          ),
        ],
      ),
    );
  }
}
