import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/icons.dart';
import 'package:instagram_clone/models/models.dart';
import 'package:instagram_clone/widgets/widgets.dart';
import 'package:video_player/video_player.dart';

import '../constants/colors.dart';
import '../helpers/helpers.dart';

class ReelItem extends StatelessWidget {
  const ReelItem({
    super.key,
    required this.index,
    required this.controller,
    required this.model,
  });

  final int index;
  final VideoPlayerController controller;
  final ReelsModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: transparent,
      child: Stack(
        children: [
          AspectRatio(
            aspectRatio: controller.value.aspectRatio,
            child: controller.value.isInitialized
                ? VideoPlayer(controller)
                : const Loader(),
          ),
          _RightSideButton(model: model),
          _LeftSideContent(model: model),
        ],
      ),
    );
  }
}

class _LeftSideContent extends StatelessWidget {
  const _LeftSideContent({
    super.key,
    required this.model,
  });

  final ReelsModel model;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      child: Container(
        height: 160,
        width: MediaQuery.of(context).size.width * .8,
        padding: const EdgeInsets.only(left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ProfilePicture(
                  radius: 16,
                  padding: 2,
                  model: StoryModel(
                    hasStories: true,
                    username: '',
                    profilePictureUrl: model.storyModel.profilePictureUrl,
                  ),
                ),
                const HorizontalSpace(5),
                Text(
                  model.storyModel.username,
                  style: const TextStyle(
                    color: white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const HorizontalSpace(10),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: white,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                  child: const Text(
                    'Seguir',
                    style: TextStyle(
                      color: white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            const VerticalSpace(15),
            if (model.caption != null)
              Text(
                model.caption!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            const VerticalSpace(10),
            Row(
              children: [
                ProfilePicture(
                  model: StoryModel(
                    username: '',
                  ),
                  radius: 8,
                  padding: 0,
                ),
                const HorizontalSpace(10),
                Expanded(
                  child: Text.rich(
                    TextSpan(
                      text: 'Le gusta a ',
                      style: const TextStyle(color: Colors.white70),
                      children: [
                        TextSpan(
                          text:
                              // '${content[mockInteger(0, content.length - 1)].storyModel.username} ',
                              model.friendName,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const TextSpan(
                            text: ' y ',
                            style: TextStyle(color: Colors.white70)),
                        const TextSpan(
                          text: '384 personas más',
                          style: TextStyle(
                            color: Colors.white70,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    style: const TextStyle(height: 1.2),
                    maxLines: 2,
                  ),
                ),
              ],
            ),
            const VerticalSpace(10),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 8),
              decoration: BoxDecoration(
                color: grey.withOpacity(.5),
                border: Border.all(color: Colors.white10),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.music_note_rounded,
                    color: white,
                    size: 15,
                  ),
                  const HorizontalSpace(5),
                  Expanded(
                    child: Text(
                      model.extraInfo!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: white),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RightSideButton extends StatelessWidget {
  const _RightSideButton({
    super.key,
    required this.model,
  });

  final ReelsModel model;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 0,
      child: Container(
        height: MediaQuery.of(context).size.height * .35,
        width: 54,
        margin: const EdgeInsets.only(right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                const SvgAnimatedIcon(
                  svgIcon: favoriteIcon,
                  svgIconPressed: favoriteIconSelected,
                  isPressed: false,
                  svgColorSelected: Color(0xffff3040),
                ),
                const VerticalSpace(4),
                Text(
                  model.totalLikes.toString(),
                  style: const TextStyle(
                    color: white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                SvgString(
                  icon: commentIcon,
                  onTap: () => ContentItemHelper.showCommentsModal(
                    context,
                    isScrollControlled: true,
                  ),
                ),
                const VerticalSpace(4),
                Text(
                  model.totalComments.toString(),
                  style: const TextStyle(
                    color: white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                const SvgString(icon: shareIcon),
                const VerticalSpace(4),
                Text(
                  model.totalShares.toString(),
                  style: const TextStyle(
                    color: white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            const Icon(
              Icons.more_vert,
              color: white,
            ),
            Container(
              height: 25,
              width: 25,
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(3),
              ),
              padding: const EdgeInsets.all(1.5),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(3),
                child: Image.network(
                  // 'https://images.pexels.com/videos/5896379/pictures/preview-0.jpeg',
                  model.storyModel.profilePictureUrl!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
