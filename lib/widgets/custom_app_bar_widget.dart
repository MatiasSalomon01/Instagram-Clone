import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/icons.dart';
import 'package:instagram_clone/providers/providers.dart';
import 'package:provider/provider.dart';

import '../constants/colors.dart';
import 'widgets.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: transparent,
      automaticallyImplyLeading: false,
      title: const SvgString(icon: instagramLogo, height: 32),
      actions: const [
        SvgString(icon: favoriteIcon),
        MessageButton(),
      ],
      bottom: PreferredSize(
        preferredSize: Size.zero,
        child: Consumer<CustomAppBarProvider>(
          builder: (context, provider, child) {
            return provider.showDivider ? Container() : child!;
          },
          child: const CustomDivider(),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
