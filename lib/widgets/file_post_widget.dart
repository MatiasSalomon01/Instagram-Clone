// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/colors.dart';
import 'package:instagram_clone/constants/others.dart';
import 'package:video_player/video_player.dart';

class FilePost extends StatelessWidget {
  const FilePost({
    super.key,
    this.url,
    required this.isVideo,
  });

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
          : Image.network(
              url!,
              fit: BoxFit.cover,
              width: size.width,
            );
    } else {
      return Video(url: url);
    }
  }
}

class Video extends StatefulWidget {
  const Video({super.key, required this.url});
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
      _controller = VideoPlayerController.network(widget.url!);
    }

    _controller.setLooping(true);
    _controller.initialize().then((value) {
      _controller.play();
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          )
        : Center(
            child: CircularProgressIndicator(color: greyText, strokeWidth: 2),
          );
  }
}
