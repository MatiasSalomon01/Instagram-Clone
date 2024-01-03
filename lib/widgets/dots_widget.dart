import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/colors.dart';
import '../providers/providers.dart';

class Dots extends StatelessWidget {
  const Dots({super.key, required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ImageDotsProvider>();
    return Container(
      height: 20,
      alignment: Alignment.center,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: count,
        itemBuilder: (context, index) {
          final bool isSameIndex = provider.imageIndex == index;
          return Container(
            height: isSameIndex ? 6 : 4,
            width: isSameIndex ? 6 : 4,
            margin: const EdgeInsets.only(right: 3),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSameIndex ? lightBlue : white,
            ),
          );
        },
      ),
    );
  }
}
