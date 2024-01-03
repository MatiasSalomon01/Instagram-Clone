import 'package:flutter/material.dart';

import '../constants/colors.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key, this.height = .4, this.marginPadding = 0});
  final double height;
  final double marginPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: white.withOpacity(.4),
      height: height,
      margin: EdgeInsets.symmetric(vertical: marginPadding),
    );
  }
}
