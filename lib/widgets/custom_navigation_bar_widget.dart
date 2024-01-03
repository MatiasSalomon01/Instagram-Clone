import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/icons.dart';
import 'package:instagram_clone/constants/others.dart';
import 'package:instagram_clone/providers/providers.dart';
import 'package:instagram_clone/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../constants/colors.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({
    super.key,
    required this.goTo,
  });
  final Function(int) goTo;

  @override
  Widget build(BuildContext context) {
    print('CustomNavigationBar se dibuja');
    final asd = Provider.of<NavigatorProvider>(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const CustomDivider(),
        Theme(
          data: ThemeData(
            splashFactory: NoSplash.splashFactory,
            highlightColor: transparent,
          ),
          child: BottomNavigationBar(
            currentIndex: asd.pageIndex,
            backgroundColor: transparent,
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedFontSize: 0,
            unselectedFontSize: 0,
            onTap: goTo,
            items: const [
              BottomNavigationBarItem(
                icon: SvgString(icon: homeIcon),
                activeIcon: SvgString(icon: homeIconSelected),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: SvgString(icon: searchIcon),
                activeIcon: SvgString(icon: searchIconSelected),
                label: '',
              ),
              BottomNavigationBarItem(
                  icon: SvgString(icon: createIcon), label: ''),
              BottomNavigationBarItem(
                icon: SvgString(icon: reelsIcon),
                activeIcon: SvgString(icon: reelsIconSelected),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: CircleAvatar(
                  radius: 13,
                  backgroundColor: white,
                  backgroundImage: NetworkImage(defaultProfilePicture),
                ),
                label: '',
              ),
            ],
          ),
        )
      ],
    );
  }
}
