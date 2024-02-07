import 'package:flutter/material.dart';
import 'package:instagram_clone/providers/providers.dart';
import 'package:instagram_clone/screens/screens.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';

class StoryBuilder extends StatefulWidget {
  const StoryBuilder({
    super.key,
    required this.index,
  });

  final int index;

  @override
  State<StoryBuilder> createState() => _StoryBuilderState();
}

class _StoryBuilderState extends State<StoryBuilder> {
  final PageController controller = PageController();
  late List<StoryModel> stories;
  @override
  void initState() {
    super.initState();
    stories = init();
  }

  @override
  void dispose() {
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
      itemBuilder: (context, index) => StoryScreen(
        pageIndex: index,
        model: stories[index],
        nextPage: _onPageChanged,
      ),
      itemCount: stories.length,
      onPageChanged: _onPageChanged,
    );
  }

  void _onPageChanged(int pageIndex) {
    controller.animateToPage(
      pageIndex,
      duration: const Duration(milliseconds: 200),
      curve: Curves.linear,
    );
  }
}
