import 'package:flutter/material.dart';

import '../colors/colors.dart';

class ChatButton extends StatelessWidget {
  const ChatButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      child: Stack(
        alignment: Alignment.center,
        children: [
          const Icon(Icons.chat, color: white, size: 25),
          Positioned(
            right: 2,
            top: 8,
            child: Container(
              height: 20,
              width: 20,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: red,
              ),
              child:
                  const Text('5', style: TextStyle(color: white, fontSize: 14)),
            ),
          )
        ],
      ),
    );
  }
}
