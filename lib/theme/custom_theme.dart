import 'package:flutter/material.dart';

import '../constants/colors.dart';

class CustomTheme {
  static final ThemeData lightMode = ThemeData.light().copyWith(
    textSelectionTheme: TextSelectionThemeData(
      selectionColor: const Color(0xff80cbc4).withOpacity(.5),
      selectionHandleColor: const Color(0xff80cbc4),
    ),
    sliderTheme: SliderThemeData(
      overlayShape: SliderComponentShape.noOverlay,
      activeTrackColor: white,
      inactiveTrackColor: Colors.white54,
      thumbShape: SliderComponentShape.noThumb,
      trackHeight: 2,
      trackShape: const RectangularSliderTrackShape(),
    ),
  );
  static final ThemeData darkMode = ThemeData.dark().copyWith(
    textSelectionTheme: TextSelectionThemeData(
      selectionColor: const Color(0xff80cbc4).withOpacity(.5),
      selectionHandleColor: const Color(0xff80cbc4),
    ),
  );
}
