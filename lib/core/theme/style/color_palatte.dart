import 'package:flutter/material.dart';

class ColorPalette {
  final Color primary;
  final Color scaffoldBackground;
  final Color textPrimary;

  const ColorPalette({
    required this.primary,
    required this.scaffoldBackground,
    required this.textPrimary,
  });

  static ColorPalette light = const ColorPalette(
    primary: Colors.blue,
    scaffoldBackground: Colors.white,
    textPrimary: Color(0xff313131),
  );

  static ColorPalette dark = const ColorPalette(
    primary: Colors.blue,
    scaffoldBackground: Color(0xff212121),
    textPrimary: Color(0xff757575),
  );

  factory ColorPalette.of(BuildContext context) {
    if (Theme.of(context).brightness == Brightness.light) {
      return light;
    } else {
      return dark;
    }
  }

  factory ColorPalette.fromBrightness(Brightness brightness) =>
      brightness == Brightness.light ? light : dark;
}
