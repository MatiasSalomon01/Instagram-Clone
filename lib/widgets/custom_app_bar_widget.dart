import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instagram_clone/providers/providers.dart';
import 'package:provider/provider.dart';

import '../colors/colors.dart';
import 'widgets.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CustomAppBarProvider>(context, listen: false);

    return AppBar(
      elevation: 0,
      backgroundColor: transparent,
      bottom: PreferredSize(
        preferredSize: Size.zero,
        child: Consumer<CustomAppBarProvider>(
          builder: (context, provider, child) {
            print('CustomAppBar redibuja CustomDivider');
            return provider.isAtEdge ? Container() : child!;
          },
          child: const CustomDivider(height: 0),
        ),
      ),
      title: Text(
        'Instagram',
        style: GoogleFonts.lobster(color: white, fontSize: 25),
      ),
      actions: const [
        Icon(Icons.favorite_border_rounded, color: white, size: 30),
        HorizontalSpace(20),
        ChatButton(),
        HorizontalSpace(10),
      ],
      notificationPredicate: (notification) => isAtEdge(notification, provider),
    );
  }

  bool isAtEdge(
    ScrollNotification notification,
    CustomAppBarProvider provider,
  ) {
    if (notification.metrics.atEdge && notification.metrics.pixels == 0) {
      provider.isAtEdge = true;
    } else if (provider.isAtEdge) {
      provider.isAtEdge = false;
    }
    return false;
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
