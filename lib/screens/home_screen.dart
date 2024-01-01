import 'package:flutter/material.dart';
import 'package:instagram_clone/colors/colors.dart';

import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: const CustomAppBar(),
      body: ListView(
        shrinkWrap: false,
        children: const [
          VerticalSpace(10),
          Stories(),
          CustomDivider(),
          Content(),
        ],
      ),
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }
}
