import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/constants/colors.dart';

class SvgString extends StatelessWidget {
  const SvgString({
    super.key,
    required this.icon,
    this.height = 25,
    this.color = white,
    this.onTap,
  });

  final String icon;
  final double height;
  final Color color;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SvgPicture.string(
        icon,
        height: height,
        colorFilter: ColorFilter.mode(
          color,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
