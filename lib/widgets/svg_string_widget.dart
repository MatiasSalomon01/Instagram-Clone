import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/colors/colors.dart';

class SvgString extends StatelessWidget {
  const SvgString({
    super.key,
    required this.icon,
    this.height = 25,
    this.color = white,
  });

  final String icon;
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.string(
      icon,
      height: height,
      colorFilter: ColorFilter.mode(
        color,
        BlendMode.srcIn,
      ),
    );
  }
}
