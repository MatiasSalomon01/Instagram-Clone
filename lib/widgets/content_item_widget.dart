import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/colors.dart';
import 'package:instagram_clone/constants/icons.dart';
import 'package:instagram_clone/extensions/extensions.dart';
import 'package:instagram_clone/models/models.dart';
import 'package:instagram_clone/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../helpers/helpers.dart';
import '../providers/providers.dart';

class ContentItem extends StatelessWidget {
  const ContentItem({super.key, required this.model});

  final ContentPostModel model;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool hasMoreThenOnePost = model.posts.length > 1;

    return ChangeNotifierProvider(
      create: (context) => ImageDotsProvider(),
      builder: (context, child) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _Header(model: model),
          _Post(hasMoreThenOnePost: hasMoreThenOnePost, model: model),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              children: [
                const VerticalSpace(12),
                _Buttons(
                  size: size,
                  hasMoreThenOnePost: hasMoreThenOnePost,
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
              if (model.showLikes) ...[
                ProfilePicture(
                  model: StoryModel(
                    username: model.friendName!,
                    profilePictureUrl: model.storyModel.profilePictureUrl,
                  ),
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
                          text: model.friendName!,
                          style: const TextStyle(
                            color: white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const TextSpan(
                            text: ' y ', style: TextStyle(color: white)),
                        TextSpan(
                          text:
                              '${model.totalLikes.formatWithSeparator()} personas más',
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
          GestureDetector(
            onTap: () => ContentItemHelper.showCommentsModal(context,
                count: model.totalComments),
            child: Text(
              'Ver los ${model.totalComments} comentarios',
              style: const TextStyle(color: whiteOpaque),
            ),
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
    required this.hasMoreThenOnePost,
    required this.model,
  });

  final Size size;
  final bool hasMoreThenOnePost;
  final ContentPostModel model;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: size.width * .3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SvgAnimatedIcon(
                    svgIcon: favoriteIcon,
                    svgIconPressed: favoriteIconSelected,
                    isPressed: false,
                    svgColorSelected: Color(0xffff3040),
                  ),
                  SvgString(
                    icon: commentIcon,
                    onTap: () => ContentItemHelper.showCommentsModal(
                      context,
                      isScrollControlled: true,
                      count: model.totalComments,
                    ),
                  ),
                  const SvgString(icon: shareIcon),
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
        if (hasMoreThenOnePost)
          Dots(count: model.posts.length > 10 ? 10 : model.posts.length),
      ],
    );
  }
}

class _Post extends StatelessWidget {
  const _Post({
    super.key,
    required this.hasMoreThenOnePost,
    required this.model,
  });

  final bool hasMoreThenOnePost;
  final ContentPostModel model;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 450,
      child: !hasMoreThenOnePost || model.posts.isEmpty
          ? FilePost(
              url: model.storyModel.profilePictureUrl,
              isVideo: false,
            )
          : PageView.builder(
              itemCount: 10,
              itemBuilder: (context, index) => FilePost(
                url: model.posts[index].fileUrl,
                isVideo: model.posts[index].isVideo(),
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
