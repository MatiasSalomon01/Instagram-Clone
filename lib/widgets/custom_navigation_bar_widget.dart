import 'package:flutter/material.dart';
import 'package:instagram_clone/routes/routes.dart';

import '../colors/colors.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      height: kBottomNavigationBarHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          _Item(
            icon: Icon(Icons.home_filled, color: white),
            routeName: Routes.home,
          ),
          _Item(
            icon: Icon(Icons.search, color: white),
            routeName: Routes.search,
          ),
          _Item(
            icon: Icon(Icons.add_box_outlined, color: white),
            routeName: Routes.action,
          ),
          _Item(
            icon: Icon(Icons.video_camera_back_outlined, color: white),
            routeName: Routes.reels,
          ),
          _Item(
            icon: CircleAvatar(
              radius: 10,
              backgroundColor: white,
              backgroundImage: NetworkImage(
                'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2c/Default_pfp.svg/340px-Default_pfp.svg.png',
              ),
            ),
            routeName: Routes.user,
          ),
        ],
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({
    super.key,
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
