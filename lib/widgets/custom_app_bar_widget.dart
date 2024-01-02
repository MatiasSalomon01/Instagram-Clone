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
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
