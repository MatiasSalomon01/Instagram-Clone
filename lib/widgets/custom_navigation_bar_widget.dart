import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/icons.dart';
import 'package:instagram_clone/constants/others.dart';
import 'package:instagram_clone/routes/routes.dart';
import 'package:instagram_clone/widgets/widgets.dart';

import '../constants/colors.dart';
import '../services/services.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomDivider(),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _Item(
                svg: homeIcon,
                svgSelected: homeIconSelected,
                routeName: Routes.home,
                changeToSelected: true,
              ),
              _Item(
                svg: searchIcon,
                svgSelected: searchIconSelected,
                routeName: Routes.search,
                changeToSelected: true,
              ),
              _Item(
                widget: SvgString(icon: createIcon),
                routeName: Routes.create,
              ),
              _Item(
                svg: reelsIcon,
                svgSelected: reelsIconSelected,
                routeName: Routes.reels,
                changeToSelected: true,
              ),
              _Item(
                widget: CircleAvatar(
                  radius: 13,
                  backgroundColor: white,
                  backgroundImage: NetworkImage(defaultProfilePicture),
                ),
                routeName: Routes.user,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({
    this.widget = const SizedBox(),
    this.svg = '',
    this.svgSelected = '',
    required this.routeName,
    this.changeToSelected = false,
  });

  final Widget widget;
  final String svg;
  final String svgSelected;
  final String routeName;
  final bool changeToSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, routeName),
      // onTap: () => Navigator.push(
      //   context,
      //   PageRouteBuilder(
      //     pageBuilder: (context, animation, secondaryAnimation) {
      //       return Routes.mapRoutes2[routeName]!;
      //     },
      //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
      //       return FadeTransition(
      //         opacity: Tween<double>(begin: 0.8, end: 1).animate(
      //           CurvedAnimation(parent: animation, curve: Curves.bounceInOut),
      //         ),
      //         child: child,
      //       );
      //     },
      //   ),
      // ),
      child: changeToSelected
          ? SvgString(
              icon: NavigatorObserverService.currentRoute == routeName
                  ? svgSelected
                  : svg,
            )
          : widget,
    );
  }
}
