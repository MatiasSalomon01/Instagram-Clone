import 'package:flutter/material.dart';
import 'package:instagram_clone/providers/providers.dart';
import 'package:instagram_clone/screens/screens.dart';
import 'package:provider/provider.dart';

import '../constants/colors.dart';
import '../widgets/widgets.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<Widget> screens = [
    const HomeScreen(),
    const SearchScreen(),
    const CreateScreen(),
    const ReelsScreen(),
    const UserScreen(),
  ];

  late final PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void goTo(int index) {
    pageController.jumpToPage(index);
    context.read<NavigatorProvider>().pageIndex = index;
    context.read<ContentProvider>().getContent();
  }

  @override
  Widget build(BuildContext context) {
    var navigationProvider = context.watch<NavigatorProvider>();
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: navigationProvider.pageIndex != 3 ? const CustomAppBar() : null,
      body: PageView.builder(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: screens.length,
        itemBuilder: (context, index) => screens[index],
      ),
      bottomNavigationBar: CustomNavigationBar(goTo: goTo),
    );
  }
}
