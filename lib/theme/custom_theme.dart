import 'package:flutter/material.dart';

class CustomTheme {
  static final ThemeData lightMode = ThemeData.light().copyWith(
    textSelectionTheme: TextSelectionThemeData(
      selectionColor: const Color(0xff80cbc4).withOpacity(.5),
      selectionHandleColor: const Color(0xff80cbc4),
    ),
  );
  static final ThemeData darkMode = ThemeData.dark().copyWith(
    textSelectionTheme: TextSelectionThemeData(
      selectionColor: const Color(0xff80cbc4).withOpacity(.5),
      selectionHandleColor: const Color(0xff80cbc4),
    ),
  );
}
