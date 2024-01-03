import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/colors.dart';
import 'package:provider/provider.dart';

import '../providers/providers.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  late final ScrollController mainController;
  late final CustomAppBarProvider customAppBarProvider;
  @override
  void initState() {
    super.initState();
    customAppBarProvider = context.read<CustomAppBarProvider>();
    mainController = ScrollController();
    mainController.addListener(isAtEdge);
  }

  @override
  void dispose() {
    mainController.dispose();
    super.dispose();
  }

  void isAtEdge() {
    if (!mainController.position.atEdge &&
        customAppBarProvider.showDivider &&
        mainController.offset > 0) {
      customAppBarProvider.showDivider = false;
    }

    if (mainController.position.outOfRange &&
        mainController.offset < 0 &&
        !customAppBarProvider.showDivider) {
      customAppBarProvider.showDivider = true;
    }

    if (mainController.position.atEdge &&
        !customAppBarProvider.showDivider &&
        mainController.offset == 0) {
      customAppBarProvider.showDivider = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: const CustomAppBar(),
      body: ListView(
        shrinkWrap: false,
        controller: mainController,
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

  @override
  bool get wantKeepAlive => true;
}
