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
    mainController.addListener(isAtFinalEdge);
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

  isAtFinalEdge() {
    if (mainController.position.atEdge && mainController.offset > 0) {
      context.read<ContentProvider>().getContent();
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final contentProvider = context.read<ContentProvider>();

    return Stack(
      children: [
        RefreshIndicator(
          onRefresh: () async => await contentProvider.refreshContent(),
          strokeWidth: 2,
          color: white,
          backgroundColor: backgroundColor,
          child: ListView(
            shrinkWrap: false,
            controller: mainController,
            padding: const EdgeInsets.symmetric(vertical: 10),
            children: const [
              Stories(),
              CustomDivider(),
              Content(),
            ],
          ),
        ),
        _loader(),
      ],
    );
  }

  Consumer<ContentProvider> _loader() {
    return Consumer<ContentProvider>(
      builder: (context, contentProvider, child) =>
          contentProvider.isLoadingContent
              ? Container(
                  color: backgroundColor.withOpacity(.5),
                  child: const Loader(),
                )
              : const SizedBox(),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
