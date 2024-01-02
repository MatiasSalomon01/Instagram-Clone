import 'package:flutter/material.dart';
import 'package:instagram_clone/icons/icons.dart';
import 'package:instagram_clone/routes/routes.dart';
import 'package:instagram_clone/widgets/widgets.dart';

import '../colors/colors.dart';

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
              SvgString(icon: homeIcon),
              SvgString(icon: searchIcon),
              SvgString(icon: createIcon),
              SvgString(icon: reelsIcon),
              _Item(
                icon: CircleAvatar(
                  radius: 13,
                  backgroundColor: white,
                  backgroundImage: NetworkImage(
                    'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2c/Default_pfp.svg/340px-Default_pfp.svg.png',
                  ),
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
      onTap: () => Navigator.pushReplacementNamed(context, routeName),
      child: icon,
    );
  }
}
