import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/colors.dart';
import 'package:instagram_clone/providers/content_provider.dart';
import 'package:provider/provider.dart';

import 'widgets.dart';

class Stories extends StatefulWidget {
  const Stories({super.key});

  @override
  State<Stories> createState() => _StoriesState();
}

class _StoriesState extends State<Stories> {
  late final ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    // scrollController.addListener(isAtFinalEdge);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  isAtFinalEdge() {
    if (scrollController.position.atEdge && scrollController.offset > 0) {
      context.read<ContentProvider>().getStories();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 124,
      child: Stack(
        children: [
          NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (notification) {
              notification.disallowIndicator();
              return false;
            },
            child: Consumer<ContentProvider>(
              builder: (context, contentProvider, child) => ListView.separated(
                controller: scrollController,
                itemCount: contentProvider.stories.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemBuilder: (context, index) => Story(
                  index: index,
                  model: contentProvider.stories[index],
                ),
                separatorBuilder: (context, index) => const HorizontalSpace(15),
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: _loader(),
          ),
        ],
      ),
    );
  }

  Consumer<ContentProvider> _loader() {
    return Consumer<ContentProvider>(
      builder: (context, contentProvider, child) =>
          contentProvider.isLoadingStories
              ? Container(
                  color: backgroundColor.withOpacity(.5),
                  child: const Loader(),
                )
              : const SizedBox(),
    );
  }
}
