import 'package:flutter/material.dart';
import 'package:instagram_clone/widgets/widgets.dart';
import 'package:mock_data/mock_data.dart';

import '../constants/colors.dart';
import '../constants/icons.dart';
import '../constants/others.dart';
import '../models/models.dart';

class Comment extends StatefulWidget {
  const Comment({super.key, required this.model});

  final CommentModel model;

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
                    username: '',
                    hasStories: random.nextBool(),
                  ),
                  marginColor: grey,
                ),
              ),
              Expanded(
                flex: 6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          widget.model.username,
                          style: const TextStyle(
                            color: white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                        const HorizontalSpace(10),
                        Text(
                          '${widget.model.days} d',
                          style: const TextStyle(
                            color: greyText,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 35),
                      child: Text(
                        widget.model.caption,
                        style: const TextStyle(
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
                        itemBuilder: (context, index) => AnswerComment(
                          model: CommentModel(
                            username: '${mockName()} ${mockName()}',
                            caption: wordGenerator
                                .randomSentence(random.nextInt(30) + 2),
                            days: mockInteger(1, 10),
                            countResponses: mockInteger(1, 50),
                            countLikes: mockInteger(1, 5000),
                          ),
                        ),
                        itemCount: widget.model.countResponses,
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
                          child: Text(
                            showAnswers
                                ? 'Ocultar respuestas'
                                : 'Ver ${widget.model.countResponses} respuestas',
                            style: const TextStyle(
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
          Positioned(
            right: 0,
            // color: Colors.yellow,
            child: SvgAnimatedIcon(
              svgIcon: favoriteIcon,
              svgIconPressed: favoriteIconSelected,
              isPressed: false,
              height: 18,
              svgColor: greyText,
              svgColorSelected: const Color(0xffff3040),
              addCounter: true,
              counter: widget.model.countLikes,
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
