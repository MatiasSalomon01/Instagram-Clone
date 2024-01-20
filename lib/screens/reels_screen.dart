import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/colors.dart';
import 'package:instagram_clone/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

import '../providers/reels_provider.dart';

class ReelsScreen extends StatelessWidget {
  const ReelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ReelsProvider(),
      builder: (context, child) => Scaffold(
        backgroundColor: backgroundColor,
        body: Consumer<ReelsProvider>(
          builder: (context, state, child) => PageView.builder(
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) => Container(
              color: transparent,
              child: AspectRatio(
                aspectRatio: state.mapVideos[index]!.value.aspectRatio,
                child: state.mapVideos[index]!.value.isInitialized
                    ? VideoPlayer(state.mapVideos[index]!)
                    : const Loader(),
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
    );
  }
}
