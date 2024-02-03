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
    return index % 2 == 0
        ? _LayoutWithVideo(index: index, photos: photos)
        : _LayoutOnlyImages(photos: photos);
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
              SeachItem(photo: photos[0]),
              SeachItem(photo: photos[1]),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              SeachItem(photo: photos[2]),
              SeachItem(photo: photos[3]),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              SeachItem(photo: photos[4]),
              SeachItem(photo: photos[5]),
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
    required this.index,
    required this.photos,
  });
  final int index;
  final List<Photos> photos;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (false)
          Expanded(
            child: SeachItem(multiplier: 2, photo: photos[0]),
          ),
        Expanded(
          child: Column(
            children: [
              SeachItem(
                photo: photos[1],
              ),
              SeachItem(
                photo: photos[2],
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              SeachItem(
                photo: photos[3],
              ),
              SeachItem(
                photo: photos[4],
              ),
            ],
          ),
        ),
        if (true)
          Expanded(
            child: SeachItem(photo: photos[5], multiplier: 2),
          ),
      ],
    );
  }
}
