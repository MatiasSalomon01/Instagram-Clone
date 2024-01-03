import 'package:flutter/material.dart';
import 'package:instagram_clone/widgets/widgets.dart';

import '../constants/colors.dart';
import '../constants/icons.dart';

class MessageButton extends StatelessWidget {
  const MessageButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    int count = 5;
    bool isTwoDigits = count > 9;
    return Container(
      // width: 40,
      height: kToolbarHeight - 15,
      width: 50,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Stack(
        alignment: Alignment.center,
        children: [
          const SvgString(icon: messagesIcon),
          Positioned(
            right: isTwoDigits ? 0 : 5,
            top: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: isTwoDigits ? 3.5 : 6),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: red,
              ),
              child: Text(
                '$count',
                style: const TextStyle(
                  color: white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
