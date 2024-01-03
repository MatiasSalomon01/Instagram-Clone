import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/colors.dart';
import 'package:instagram_clone/constants/icons.dart';
import 'package:instagram_clone/extensions/extensions.dart';
import 'package:instagram_clone/models/models.dart';
import 'package:instagram_clone/widgets/widgets.dart';
import 'package:mock_data/mock_data.dart';

import '../mock/mock_data.dart';

class ContentItem extends StatelessWidget {
  const ContentItem({super.key, required this.model});

  final ContentPostModel model;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
          child: Row(
            children: [
              ProfilePicture(
                model: model.storyModel,
                radius: 16,
                padding: 2,
              ),
              const HorizontalSpace(10),
              Text(
                model.storyModel.username,
                style: const TextStyle(color: white),
              ),
              const HorizontalSpace(5),
              if (model.storyModel.isVerified)
                const Icon(Icons.verified, color: lightBlue, size: 18),
              const Spacer(),
              const Icon(Icons.more_vert, color: white),
            ],
          ),
        ),
        Image.network(
          // 'https://pbs.twimg.com/media/FqtnngIXoAQ_Z9z.jpg:large',
          model.storyModel.profilePictureUrl!,
          fit: BoxFit.cover,
          height: 450,
          width: size.width,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: [
              const VerticalSpace(12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: size.width * .3,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgAnimatedIcon(
                          svgIcon: favoriteIcon,
                          svgIconPressed: favoriteIconSelected,
                          isPressed: false,
                          svgColor: Color(0xffff3040),
                        ),
                        SvgString(icon: commentIcon),
                        SvgString(icon: shareIcon),
                      ],
                    ),
                  ),
                  const SvgAnimatedIcon(
                    svgIcon: saveIcon,
                    svgIconPressed: saveIconSelected,
                    isPressed: false,
                  ),
                ],
              ),
              const VerticalSpace(10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        if (model.likedBy.isNotEmpty) ...[
                          ProfilePicture(
                            model: stories[mockInteger(1, stories.length - 1)],
                            radius: 10,
                            padding: 0,
                          ),
                          const HorizontalSpace(10),
                          Expanded(
                            child: Text.rich(
                              TextSpan(
                                text: model.likedBy.length > 1
                                    ? 'Les gusta a '
                                    : 'Le gusta a ',
                                style: const TextStyle(color: white),
                                children: [
                                  TextSpan(
                                    text:
                                        '${content[mockInteger(0, content.length - 1)].storyModel.username} ',
                                    style: const TextStyle(
                                      color: white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  if (model.likedBy.length > 1) ...[
                                    const TextSpan(
                                        text: 'y ',
                                        style: TextStyle(color: white)),
                                    TextSpan(
                                      text:
                                          '${(model.likedBy.length - 1).toString()} personas más',
                                      style: const TextStyle(
                                        color: white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ],
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                    if (model.caption.isNotEmpty) ...[
                      const VerticalSpace(6),
                      Text.rich(
                        TextSpan(
                          text: '${model.storyModel.username} ',
                          style: const TextStyle(
                            color: white,
                            fontWeight: FontWeight.bold,
                          ),
                          children: [
                            TextSpan(
                              text: model.caption,
                              style: const TextStyle(
                                color: white,
                                fontWeight: FontWeight.normal,
                              ),
                            )
                          ],
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                    const VerticalSpace(6),
                    Text(
                      'Ver los ${model.totalComments} comentarios',
                      style: const TextStyle(color: whiteOpaque),
                    ),
                    const VerticalSpace(6),
                    Text(
                      model.createAt.getDateHumanized(),
                      style: const TextStyle(color: whiteOpaque, fontSize: 13),
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
