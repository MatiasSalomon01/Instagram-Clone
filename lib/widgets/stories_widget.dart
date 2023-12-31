import 'package:flutter/material.dart';

import '../mock/mock_data.dart';
import 'widgets.dart';

class Stories extends StatelessWidget {
  const Stories({super.key});

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return SizedBox(
      height: 130,
      child: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (notification) {
          notification.disallowIndicator();
          return false;
        },
        child: ListView.separated(
          itemCount: stories.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          itemBuilder: (context, index) => Story(username: stories[index]),
          separatorBuilder: (context, index) => const HorizontalSpace(15),
        ),
      ),
    );
  }
}
