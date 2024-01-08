import 'package:flutter/material.dart';
import 'package:instagram_clone/widgets/widgets.dart';

import '../constants/colors.dart';
import '../constants/icons.dart';
import '../models/models.dart';

class Comment extends StatefulWidget {
  const Comment({
    super.key,
  });

  @override
  State<Comment> createState() => _CommentState();
}

class _CommentState extends State<Comment> {
  bool showAnswers = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20),
      child: Stack(
        children: [
          Row(
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
              Expanded(
                flex: 6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Text(
                          'username',
                          style: TextStyle(
                            color: white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                        HorizontalSpace(10),
                        Text(
                          '3 d',
                          style: TextStyle(
                            color: greyText,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 25),
                      child: Text(
                        'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
                        style: TextStyle(
                          color: white,
                          fontSize: 12,
                        ),
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
                    if (showAnswers)
                      ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        separatorBuilder: (context, index) =>
                            const VerticalSpace(20),
                        shrinkWrap: true,
                        padding: const EdgeInsets.only(top: 20),
                        itemBuilder: (context, index) => const AnswerComment(),
                        itemCount: 6,
                      ),
                    const VerticalSpace(12),
                    Row(
                      children: [
                        const CustomDivider(
                          width: 45,
                          color: greyText,
                        ),
                        const HorizontalSpace(12),
                        GestureDetector(
                          onTap: () =>
                              setState(() => showAnswers = !showAnswers),
                          child: const Text(
                            'Ver 7 respuestas',
                            style: TextStyle(
                              color: greyText,
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Positioned(
            right: 0,
            // color: Colors.yellow,
            child: SvgAnimatedIcon(
              svgIcon: favoriteIcon,
              svgIconPressed: favoriteIconSelected,
              isPressed: false,
              height: 18,
              svgColor: greyText,
              svgColorSelected: Color(0xffff3040),
              addCounter: true,
              counter: 10,
            ),
          ),
        ],
      ),
    );
  }
}
