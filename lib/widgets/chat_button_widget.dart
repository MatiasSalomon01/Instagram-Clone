import 'package:flutter/material.dart';
import 'package:instagram_clone/widgets/widgets.dart';

import '../colors/colors.dart';
import '../icons/icons.dart';

class MessageButton extends StatelessWidget {
  const MessageButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 40,
      height: kToolbarHeight - 10,
      width: 50,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Stack(
        alignment: Alignment.center,
        children: [
          const SvgString(icon: messagesIcon),
          Positioned(
            right: 0,
            top: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: red,
              ),
              child: const Text(
                '11',
                style: TextStyle(
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
