import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/colors.dart';
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
        padding: const EdgeInsets.symmetric(vertical: 10),
        children: const [
          Stories(),
          CustomDivider(),
          Content(),
        ],
      ),
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }
}
