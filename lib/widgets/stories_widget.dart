import 'package:flutter/material.dart';
import 'package:instagram_clone/widgets/horizontal_space_widget.dart';

import '../colors/colors.dart';

class Stories extends StatelessWidget {
  const Stories({super.key});

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return Container(
      height: 200,
      child: ListView.separated(
        itemCount: 6,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        itemBuilder: (context, index) => const Story(),
        separatorBuilder: (context, index) => const HorizontalSpace(15),
      ),
    );
  }
}

class Story extends StatelessWidget {
  const Story({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(4),
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
              radius: 45,
              backgroundColor: white,
              backgroundImage: NetworkImage(
                'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2c/Default_pfp.svg/340px-Default_pfp.svg.png',
              ),
            ),
          ),
        ),
      ],
    );
  }
}
