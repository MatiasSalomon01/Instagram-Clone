// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/others.dart';
import 'package:instagram_clone/providers/providers.dart';
import 'package:instagram_clone/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class FilePost extends StatelessWidget {
  const FilePost({
    super.key,
    required this.index,
    this.url,
    required this.isVideo,
  });

  final int index;
  final String? url;
  final bool isVideo;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if (!isVideo) {
      return url == null
          ? Image.asset(
              defaultProfilePicture,
              fit: BoxFit.cover,
              width: size.width,
            )
          : CachedNetworkImage(
              imageUrl: url!,
              placeholderFadeInDuration: const Duration(milliseconds: 500),
              fit: BoxFit.cover,
              width: size.width,
            );
    } else {
      return Video(index: index, url: url);
    }
  }
}

class Video extends StatefulWidget {
  const Video({
    super.key,
    required this.index,
    required this.url,
  });
  final int index;
  final String? url;

  @override
  State<Video> createState() => _VideoState();
}

class _VideoState extends State<Video> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    if (widget.url!.endsWith('.mp4')) {
      _controller = VideoPlayerController.asset(widget.url!);
    } else {
      _controller = VideoPlayerController.networkUrl(Uri.parse(widget.url!));
    }

    _controller.setLooping(true);
    // _controller.initialize().then((value) {
    //   _controller.play();
    //   setState(() {});
    // });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  asd() {
    _controller.initialize();
    _controller.play();
    return VideoPlayer(_controller);
  }

  @override
  Widget build(BuildContext context) {
    if (context.read<ImageDotsProvider>().imageIndex == widget.index) {
      _controller.initialize();
      _controller.play();
    }

    return _controller.value.isInitialized
        ? AspectRatio(
            aspectRatio: 9 / 16,
            child: context.read<ImageDotsProvider>().imageIndex == widget.index
                ? asd()
                : null,
          )
        : Loader();
  }
}
