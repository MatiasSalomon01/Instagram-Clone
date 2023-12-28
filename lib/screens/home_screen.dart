import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instagram_clone/colors/colors.dart';
import 'package:instagram_clone/widgets/horizontal_space_widget.dart';

import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: transparent,
        title: Text(
          'Instagram',
          style: GoogleFonts.lobster(color: white, fontSize: 25),
        ),
        actions: const [
          Icon(Icons.favorite_border_rounded, color: white, size: 30),
          HorizontalSpace(20),
          ChatButton(),
          HorizontalSpace(5),
        ],
      ),
    );
  }
}
