import 'package:flutter/material.dart';

class ColorPalette {
  final Color primary;
  final Color scaffoldBackground;
  final Color textPrimary;
  final Color white = Colors.white;
  final Color success = const Color(0xff1FA14F);
  final Color info = const Color(0xffF1AF05);
  final Color red = const Color(0xffEB464A);
  final Color silver = const Color(0xffF2F2F2);

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
