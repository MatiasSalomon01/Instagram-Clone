import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/colors.dart';
import 'package:instagram_clone/constants/icons.dart';
import 'package:instagram_clone/models/models.dart';
import 'package:instagram_clone/widgets/widgets.dart';
import 'package:mock_data/mock_data.dart';

import '../mock/mock_data.dart';

class ContentItem extends StatelessWidget {
  const ContentItem({super.key, required this.model});

  final StoryModel model;

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
                model: model,
                radius: 16,
                padding: 2,
              ),
              const HorizontalSpace(10),
              Text(
                model.username,
                style: const TextStyle(color: white),
              ),
              const HorizontalSpace(5),
              if (model.isVerified)
                const Icon(Icons.verified, color: lightBlue, size: 18),
              const Spacer(),
              const Icon(Icons.more_vert, color: white),
            ],
          ),
        ),
        Image.network(
          // 'https://pbs.twimg.com/media/FqtnngIXoAQ_Z9z.jpg:large',
          model.profilePictureUrl!,
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
                        SvgString(icon: favoriteIcon),
                        SvgString(icon: commentIcon),
                        SvgString(icon: shareIcon),
                      ],
                    ),
                  ),
                  const SvgString(icon: saveIcon),
                ],
              ),
              const VerticalSpace(10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        ProfilePicture(
                          model: content[0],
                          radius: 10,
                          padding: 0,
                        ),
                        const HorizontalSpace(10),
                        Expanded(
                          child: Text.rich(
                            TextSpan(
                              text: 'Les gusta ',
                              style: const TextStyle(color: white),
                              children: [
                                TextSpan(
                                  text:
                                      '${content[mockInteger(0, content.length - 1)].username} ',
                                  style: const TextStyle(
                                    color: white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const TextSpan(
                                    text: 'y ', style: TextStyle(color: white)),
                                TextSpan(
                                  text:
                                      '${(content.length - 1).toString()} personas más',
                                  style: const TextStyle(
                                    color: white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const VerticalSpace(6),
                    const Text.rich(
                      TextSpan(
                        text: 'championsleague ',
                        style: TextStyle(
                          color: white,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          TextSpan(
                            text:
                                'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
                            style: TextStyle(
                              color: white,
                              fontWeight: FontWeight.normal,
                            ),
                          )
                        ],
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const VerticalSpace(6),
                    const Text(
                      'Ver los 6,053 comentarios',
                      style: TextStyle(color: whiteOpaque),
                    ),
                    const VerticalSpace(6),
                    const Text(
                      'Hace 2 días',
                      style: TextStyle(color: whiteOpaque, fontSize: 13),
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
