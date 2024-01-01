import 'package:flutter/material.dart';

import '../colors/colors.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(color: white.withOpacity(.5), height: 5);
  }
}
