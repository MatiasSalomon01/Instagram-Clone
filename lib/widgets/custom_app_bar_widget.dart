import 'package:flutter/material.dart';
import 'package:instagram_clone/icons/icons.dart';
import 'package:instagram_clone/providers/providers.dart';
import 'package:provider/provider.dart';

import '../colors/colors.dart';
import 'widgets.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: transparent,
      bottom: PreferredSize(
        preferredSize: Size.zero,
        child: Consumer<CustomAppBarProvider>(
          builder: (context, provider, child) {
            print('CustomAppBar redibuja CustomDivider');
            return provider.showDivider ? Container() : child!;
          },
          child: const CustomDivider(),
        ),
      ),
      title: const SvgString(icon: instagramLogo, height: 32),
      actions: const [
        SvgString(icon: favoriteIcon),
        MessageButton(),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
