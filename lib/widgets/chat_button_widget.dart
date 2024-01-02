import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../colors/colors.dart';
import '../icons/icons.dart';

class MessageButton extends StatelessWidget {
  const MessageButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SvgPicture.string(
            messagesIcon,
            height: 25,
            colorFilter: const ColorFilter.mode(
              white,
              BlendMode.srcIn,
            ),
          ),
          // Positioned(
          //   // right: 0,
          //   // top: -5,
          //   child: Container(
          //     height: 20,
          //     width: 20,
          //     alignment: Alignment.center,
          //     decoration: const BoxDecoration(
          //       shape: BoxShape.circle,
          //       color: red,
          //     ),
          //     child:
          //         const Text('5', style: TextStyle(color: white, fontSize: 14)),
          //   ),
          // )
        ],
      ),
    );
  }
}
