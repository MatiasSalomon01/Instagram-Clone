import 'package:flutter/material.dart';

import '../colors/colors.dart';
import 'widgets.dart';

class YourStory extends StatelessWidget {
  const YourStory({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Story(),
        Positioned(
          bottom: 0,
          right: 10,
          child: Container(
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: backgroundColor,
              shape: BoxShape.circle,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: lightBlue,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.add, color: white),
            ),
          ),
        )
      ],
    );
  }
}
