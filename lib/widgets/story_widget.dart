import 'package:flutter/material.dart';
import 'package:instagram_clone/widgets/widgets.dart';

import '../colors/colors.dart';

class Story extends StatelessWidget {
  const Story({
    super.key,
    required this.username,
    this.myStory = false,
  });

  final String username;
  final bool myStory;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 87),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(3),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      Color(0xffd400c6),
                      Color(0xfffcc65a),
                    ],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.all(3),
                  decoration: const BoxDecoration(
                    color: backgroundColor,
                    shape: BoxShape.circle,
                  ),
                  child: const CircleAvatar(
                    radius: 40,
                    backgroundColor: white,
                    backgroundImage: NetworkImage(
                      'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2c/Default_pfp.svg/340px-Default_pfp.svg.png',
                    ),
                  ),
                ),
              ),
              if (myStory)
                Positioned(
                  bottom: 8,
                  right: -2,
                  child: Container(
                    padding: const EdgeInsets.all(3),
                    decoration: const BoxDecoration(
                      color: backgroundColor,
                      shape: BoxShape.circle,
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(3),
                      decoration: const BoxDecoration(
                        color: lightBlue,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.add,
                        color: white,
                        size: 20,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          const VerticalSpace(5),
          Text(
            username,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: const TextStyle(color: white),
          ),
        ],
      ),
    );
  }
}
