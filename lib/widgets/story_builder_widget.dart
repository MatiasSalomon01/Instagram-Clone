import 'package:flutter/material.dart';
import 'package:instagram_clone/providers/providers.dart';
import 'package:instagram_clone/screens/screens.dart';
import 'package:provider/provider.dart';

class StoryBuilder extends StatelessWidget {
  const StoryBuilder({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    final content = context.read<ContentProvider>();
    return PageView.builder(
      itemBuilder: (context, index) => StoryScreen(
        model: content.stories[index],
      ),
      itemCount: content.stories.length,
    );
  }
}
