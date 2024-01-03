import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/colors.dart';
import 'package:instagram_clone/constants/icons.dart';
import 'package:instagram_clone/extensions/extensions.dart';
import 'package:instagram_clone/models/models.dart';
import 'package:instagram_clone/widgets/widgets.dart';
import 'package:mock_data/mock_data.dart';
import 'package:provider/provider.dart';

import '../mock/mock_data.dart';
import '../providers/providers.dart';

class ContentItem extends StatelessWidget {
  const ContentItem({super.key, required this.model});

  final ContentPostModel model;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool hasMoreThenOneImage = model.images.length > 1;

    return ChangeNotifierProvider(
      create: (context) => ImageDotsProvider(),
      builder: (context, child) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _Header(model: model),
          _Post(hasMoreThenOneImage: hasMoreThenOneImage, model: model),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              children: [
                const VerticalSpace(12),
                _Buttons(
                  size: size,
                  hasMoreThenOneImage: hasMoreThenOneImage,
                  model: model,
                ),
                const VerticalSpace(10),
                _Information(model: model)
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _Information extends StatelessWidget {
  const _Information({
    super.key,
    required this.model,
  });

  final ContentPostModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                              text: 'y ', style: TextStyle(color: white)),
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
    );
  }
}

class _Buttons extends StatelessWidget {
  const _Buttons({
    super.key,
    required this.size,
    required this.hasMoreThenOneImage,
    required this.model,
  });

  final Size size;
  final bool hasMoreThenOneImage;
  final ContentPostModel model;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
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
        if (hasMoreThenOneImage)
          Dots(
            count: model.images.length > 10 ? 10 : model.images.length,
          ),
      ],
    );
  }
}

class _Post extends StatelessWidget {
  const _Post({
    super.key,
    required this.hasMoreThenOneImage,
    required this.model,
  });

  final bool hasMoreThenOneImage;
  final ContentPostModel model;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 450,
      child: !hasMoreThenOneImage || model.images.isEmpty
          ? ImagePost(url: model.storyModel.profilePictureUrl)
          : PageView.builder(
              itemCount: model.images.length,
              itemBuilder: (context, index) => ImagePost(
                url: model.images[index],
              ),
              onPageChanged: (value) =>
                  context.read<ImageDotsProvider>().imageIndex = value,
            ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    super.key,
    required this.model,
  });

  final ContentPostModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
