import 'package:flutter/material.dart';

import '../constants/colors.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
    this.height = .4,
    this.marginPadding = 0,
    this.color = white,
    this.width,
  });
  final double height;
  final double marginPadding;
  final Color color;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color.withOpacity(.4),
      height: height,
      width: width,
      margin: EdgeInsets.symmetric(vertical: marginPadding),
    );
  }
}
