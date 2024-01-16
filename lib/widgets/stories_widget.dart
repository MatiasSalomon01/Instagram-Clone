import 'package:flutter/material.dart';
import 'package:instagram_clone/providers/content_provider.dart';
import 'package:provider/provider.dart';

import 'widgets.dart';

class Stories extends StatelessWidget {
  const Stories({super.key});

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    final contentProvider = context.read<ContentProvider>();
    return SizedBox(
      height: 124,
      child: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (notification) {
          notification.disallowIndicator();
          return false;
        },
        child: ListView.separated(
          itemCount: contentProvider.stories.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          itemBuilder: (context, index) =>
              Story(model: contentProvider.stories[index]),
          separatorBuilder: (context, index) => const HorizontalSpace(15),
        ),
      ),
    );
  }
}
