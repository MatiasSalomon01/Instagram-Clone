import 'package:flutter/material.dart';

import '../models/models.dart';
import 'widgets.dart';

class SeachItemLayout extends StatelessWidget {
  const SeachItemLayout({
    super.key,
    required this.index,
    required this.photos,
  });

  final int index;
  final List<Photos> photos;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _LayoutWithVideo(
            isEven: index % 2 == 0, photos: photos.take(5).toList()),
        _LayoutOnlyImages(photos: photos.skip(5).take(6).toList()),
      ],
    );
  }
}

class _LayoutOnlyImages extends StatelessWidget {
  const _LayoutOnlyImages({
    super.key,
    required this.photos,
  });

  final List<Photos> photos;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              SeachItem(url: photos[0].src.tiny),
              SeachItem(url: photos[1].src.tiny),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              SeachItem(url: photos[2].src.tiny),
              SeachItem(url: photos[3].src.tiny),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              SeachItem(url: photos[4].src.tiny),
              SeachItem(url: photos[5].src.tiny),
            ],
          ),
        ),
      ],
    );
  }
}

class _LayoutWithVideo extends StatelessWidget {
  const _LayoutWithVideo({
    super.key,
    required this.isEven,
    required this.photos,
  });
  final bool isEven;
  final List<Photos> photos;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!isEven)
          Expanded(
            child: SeachItem(multiplier: 2, url: photos[0].src.portrait),
          ),
        Expanded(
          child: Column(
            children: [
              SeachItem(
                url: photos[1].src.tiny,
              ),
              SeachItem(
                url: photos[2].src.tiny,
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              SeachItem(
                url: photos[3].src.tiny,
              ),
              SeachItem(
                url: photos[4].src.tiny,
              ),
            ],
          ),
        ),
        if (isEven)
          Expanded(
            child: SeachItem(url: photos[0].src.portrait, multiplier: 2),
          ),
      ],
    );
  }
}
