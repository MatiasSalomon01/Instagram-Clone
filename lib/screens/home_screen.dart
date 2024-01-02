import 'package:flutter/material.dart';
import 'package:instagram_clone/colors/colors.dart';
import 'package:provider/provider.dart';

import '../providers/providers.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CustomAppBarProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: const CustomAppBar(),
      body: ListView(
        shrinkWrap: false,
        controller: provider.mainController,
        physics: const BouncingScrollPhysics(),
        children: const [
          VerticalSpace(10),
          Stories(),
          CustomDivider(marginPadding: 5),
          Content(),
        ],
      ),
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }
}
