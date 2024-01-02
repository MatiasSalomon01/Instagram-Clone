import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/icons.dart';
import 'package:instagram_clone/constants/others.dart';
import 'package:instagram_clone/routes/routes.dart';
import 'package:instagram_clone/widgets/widgets.dart';

import '../constants/colors.dart';

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
                icon: SvgString(icon: homeIcon),
                routeName: Routes.home,
              ),
              _Item(
                icon: SvgString(icon: searchIcon),
                routeName: Routes.search,
              ),
              _Item(
                icon: SvgString(icon: createIcon),
                routeName: Routes.create,
              ),
              _Item(
                icon: SvgString(icon: reelsIcon),
                routeName: Routes.reels,
              ),
              _Item(
                icon: CircleAvatar(
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
    required this.icon,
    required this.routeName,
  });

  final Widget icon;
  final String routeName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, routeName),
      child: icon,
    );
  }
}
