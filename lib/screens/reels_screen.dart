import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/colors.dart';
import 'package:instagram_clone/models/models.dart';
import 'package:instagram_clone/widgets/widgets.dart';
import 'package:mock_data/mock_data.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

import '../constants/icons.dart';
import '../helpers/helpers.dart';
import '../providers/reels_provider.dart';

class ReelsScreen extends StatelessWidget {
  const ReelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ReelsProvider(),
      builder: (context, child) => Scaffold(
        backgroundColor: backgroundColor,
        body: SafeArea(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 22),
                child: Consumer<ReelsProvider>(
                  builder: (context, state, child) => PageView.builder(
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) => Container(
                      color: transparent,
                      child: Stack(
                        children: [
                          AspectRatio(
                            aspectRatio:
                                state.mapVideos[index]!.value.aspectRatio,
                            child: state.mapVideos[index]!.value.isInitialized
                                ? VideoPlayer(state.mapVideos[index]!)
                                : const Loader(),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              // color: red,
                              height: MediaQuery.of(context).size.height * .35,
                              width: 54,
                              margin: const EdgeInsets.only(right: 10),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  const Column(
                                    children: [
                                      SvgAnimatedIcon(
                                        svgIcon: favoriteIcon,
                                        svgIconPressed: favoriteIconSelected,
                                        isPressed: false,
                                        svgColorSelected: Color(0xffff3040),
                                      ),
                                      VerticalSpace(4),
                                      Text(
                                        'Me gusta',
                                        style: TextStyle(
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
                                        onTap: () =>
                                            ContentItemHelper.showCommentsModal(
                                          context,
                                          isScrollControlled: true,
                                        ),
                                      ),
                                      const VerticalSpace(4),
                                      const Text(
                                        '418',
                                        style: TextStyle(
                                          color: white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Column(
                                    children: [
                                      SvgString(icon: shareIcon),
                                      VerticalSpace(4),
                                      Text(
                                        '55.6 mil',
                                        style: TextStyle(
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
                                        'https://images.pexels.com/videos/5896379/pictures/preview-0.jpeg',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            child: Container(
                              // color: lightBlue,
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
                                            username: 'lol',
                                            profilePictureUrl:
                                                'https://images.pexels.com/videos/5896379/pictures/preview-0.jpeg'),
                                      ),
                                      const HorizontalSpace(5),
                                      Text(
                                        'username',
                                        style: const TextStyle(
                                          color: white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      // const HorizontalSpace(5),
                                      // Container(
                                      //   color: white,
                                      //   child: const Icon(
                                      //     Icons.verified,
                                      //     color: lightBlue,
                                      //     size: 18,
                                      //   ),
                                      // ),
                                      const HorizontalSpace(10),
                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: white,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        padding: EdgeInsets.symmetric(
                                            vertical: 3, horizontal: 10),
                                        child: Text(
                                          'Seguir',
                                          style: TextStyle(
                                            color: white,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  VerticalSpace(15),
                                  Text(
                                    'Este es el caption',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  VerticalSpace(10),
                                  Row(
                                    children: [
                                      ProfilePicture(
                                        model: StoryModel(username: mockName()),
                                        radius: 8,
                                        padding: 0,
                                      ),
                                      const HorizontalSpace(10),
                                      Expanded(
                                        child: Text.rich(
                                          TextSpan(
                                            text: 'Le gusta a ',
                                            style: const TextStyle(
                                                color: Colors.white70),
                                            children: [
                                              TextSpan(
                                                text:
                                                    // '${content[mockInteger(0, content.length - 1)].storyModel.username} ',
                                                    mockName(),
                                                style: const TextStyle(
                                                  color: Colors.white70,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              const TextSpan(
                                                  text: ' y ',
                                                  style: TextStyle(
                                                      color: Colors.white70)),
                                              TextSpan(
                                                text: '384 personas más',
                                                style: const TextStyle(
                                                  color: Colors.white70,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                          style: TextStyle(height: 1.2),
                                          maxLines: 2,
                                        ),
                                      ),
                                    ],
                                  ),
                                  VerticalSpace(10),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 3, horizontal: 8),
                                    decoration: BoxDecoration(
                                        color: grey.withOpacity(.5),
                                        border:
                                            Border.all(color: Colors.white10),
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          Icons.music_note_rounded,
                                          color: white,
                                          size: 15,
                                        ),
                                        HorizontalSpace(5),
                                        Text(
                                          'nombre de la cancion o audio',
                                          style: TextStyle(color: white),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    itemCount: state.mapVideos.length,
                    onPageChanged: (value) {
                      if (value > state.currentIndex) {
                        state.nextVideo(value);
                      } else {
                        state.previousVideo(value);
                      }
                    },
                  ),
                ),
              ),
              const Positioned(
                right: 21,
                top: 10,
                child: Icon(
                  Icons.camera_alt_outlined,
                  color: white,
                  size: 30,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
