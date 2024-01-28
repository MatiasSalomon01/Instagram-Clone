import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/icons.dart';
import 'package:instagram_clone/extensions/extensions.dart';
import 'package:instagram_clone/models/models.dart';
import 'package:instagram_clone/providers/providers.dart';
import 'package:instagram_clone/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
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
          const _Opacity(),
          _RightSideButton(model: model),
          _LeftSideContent(model: model),
        ],
      ),
    );
  }
}

class _Opacity extends StatelessWidget {
  const _Opacity();

  @override
  Widget build(BuildContext context) {
    return Consumer<ReelsProvider>(
      builder: (context, state, child) {
        if (state.darkenScreen) {
          return GestureDetector(
            onTap: () => state.darkenScreen = !state.darkenScreen,
            child: Container(
              color: backgroundColor.withOpacity(.4),
            ),
          );
        } else {
          return Container(
            height: 1,
            width: 1,
            color: red,
          );
        }
      },
    );
  }
}

class _LeftSideContent extends StatelessWidget {
  const _LeftSideContent({
    required this.model,
  });

  final ReelsModel model;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      child: Container(
        constraints: const BoxConstraints(maxHeight: 310, minHeight: 160),
        width: MediaQuery.of(context).size.width * .8,
        padding: const EdgeInsets.only(left: 15, bottom: 15),
        // color: lightBlue,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
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
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 15),
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
            if (model.caption != null) ...[
              const VerticalSpace(15),
              _Caption(caption: model.caption!)
            ],
            if (model.showLikes) ...[
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
                          TextSpan(
                            text:
                                '${(model.totalLikes - 1).formatWithSeparator()} personas más',
                            style: const TextStyle(
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
              )
            ],
            const VerticalSpace(10),
            GestureDetector(
              onTap: () async => await launchInBrowser(model.extraInfo!),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 8),
                decoration: BoxDecoration(
                  color: grey.withOpacity(.7),
                  border: Border.all(color: Colors.white10),
                  borderRadius: BorderRadius.circular(50),
                ),
                // width: 250,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.music_note_rounded,
                      color: white,
                      size: 15,
                    ),
                    const HorizontalSpace(5),
                    Flexible(
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
            ),
          ],
        ),
      ),
    );
  }

  Future<void> launchInBrowser(String url) async {
    if (!await launchUrl(
      Uri.parse(url),
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }
}

class _Caption extends StatelessWidget {
  const _Caption({
    required this.caption,
  });

  final String caption;

  @override
  Widget build(BuildContext context) {
    return Consumer<ReelsProvider>(
      builder: (context, state, child) => AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        height: state.darkenScreen ? 150 : 20,
        constraints: const BoxConstraints(maxHeight: 150),
        child: GestureDetector(
          onTap: () => state.darkenScreen = !state.darkenScreen,
          child: Stack(
            children: [
              SingleChildScrollView(
                physics: state.darkenScreen
                    ? const BouncingScrollPhysics()
                    : const NeverScrollableScrollPhysics(),
                child: Text(
                  caption,
                  maxLines: state.darkenScreen ? 500 : 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RightSideButton extends StatelessWidget {
  const _RightSideButton({
    required this.model,
  });

  final ReelsModel model;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 0,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .37,
        width: 60,
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
                  model.totalLikes.formatWithWords(),
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
                    count: model.totalComments,
                  ),
                ),
                const VerticalSpace(4),
                Text(
                  model.totalComments.formatWithWords(),
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
                  model.totalShares.formatWithWords(),
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
