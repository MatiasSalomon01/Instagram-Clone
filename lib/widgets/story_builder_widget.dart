import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:instagram_clone/providers/providers.dart';
import 'package:instagram_clone/screens/screens.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';

class StoryBuilder extends StatefulWidget {
  final int index;

  const StoryBuilder({
    super.key,
    required this.index,
  });

  @override
  State<StoryBuilder> createState() => _StoryBuilderState();
}

class _StoryBuilderState extends State<StoryBuilder> {
  final PageController controller = PageController();
  late List<StoryModel> stories;
  double value = 0;

  @override
  void initState() {
    super.initState();
    stories = init();
    controller.addListener(_listener);
  }

  @override
  void dispose() {
    controller.removeListener(_listener);
    controller.dispose();
    super.dispose();
  }

  List<StoryModel> init() {
    List<StoryModel> stories = [];

    final content = context.read<ContentProvider>();

    final firstPart = content.stories
        .sublist(widget.index)
        .where((model) => model.hasStories);
    final secondPart = content.stories
        .sublist(0, widget.index)
        .where((model) => model.hasStories);

    stories.addAll(firstPart);
    stories.addAll(secondPart);

    return stories;
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller,
      itemBuilder: (context, index) {
        final isLeaving = (index - value) <= 0;
        final t = (index - value);
        final rotationY = lerpDouble(0, 90, t);
        final transform = Matrix4.identity();
        transform.setEntry(3, 2, 0.001);
        transform.rotateY(-degToRad(rotationY!));

        return Transform(
          alignment: isLeaving ? Alignment.centerRight : Alignment.centerLeft,
          transform: transform,
          child: StoryScreen(
            pageIndex: index,
            model: stories[index],
            nextPage: _onPageChanged,
          ),
        );
      },
      itemCount: stories.length,
      onPageChanged: _onPageChanged,
    );
  }

  void _onPageChanged(int pageIndex) {
    controller.animateToPage(
      pageIndex,
      duration: const Duration(milliseconds: 250),
      curve: Curves.linear,
    );
  }

  void _listener() {
    setState(() {
      value = controller.page!;
    });
  }

  double degToRad(double deg) => deg * (pi / 180.0);
}
