import 'package:flutter/material.dart';
import 'package:weather_app/core/theme/data/theme_cache.dart';
import 'package:weather_app/core/theme/style/color_palatte.dart';

enum theme { system, light, dark }

class WeatherTheme {
  static bool isDark(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark ? true : false;

  static Future<String> getThemeId() async {
    String currentThemeId = await ThemeCache.getThemeId();
    if (currentThemeId == ThemeMode.light.toString() ||
        currentThemeId == ThemeMode.dark.toString()) {
      return currentThemeId;
    } else {
      return getThemeIdBySystem();
    }
  }

  static String getThemeIdBySystem() =>
      isSystemDark() ? ThemeMode.dark.toString() : ThemeMode.light.toString();

  static bool isSystemDark() {
    return WidgetsBinding.instance.window.platformBrightness == Brightness.dark;
  }

  static final ThemeData light = ThemeData(
    useMaterial3: true,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.light,
    primaryColor: ColorPalette.light.primary,
    scaffoldBackgroundColor: ColorPalette.light.scaffoldBackground,
    cardColor: ColorPalette.light.scaffoldBackground,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(ColorPalette.light.primary),
        foregroundColor: MaterialStateProperty.all(Colors.white),
        elevation: MaterialStateProperty.all(0),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        textStyle: MaterialStateProperty.all(
          TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: ColorPalette.light.white,
          ),
        ),
      ),
    ),
    textTheme: TextTheme(
      labelSmall: Typography.englishLike2021.labelSmall?.copyWith(
        height: 1.5,
        letterSpacing: 0,
        color: ColorPalette.light.textPrimary,
        fontSize: 10,
        fontWeight: FontWeight.w500,
      ),
      labelMedium: Typography.englishLike2021.labelMedium?.copyWith(
        height: 1.5,
        letterSpacing: 0,
        color: ColorPalette.light.textPrimary,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
      labelLarge: Typography.englishLike2021.labelLarge?.copyWith(
        height: 1.5,
        letterSpacing: 0,
        color: ColorPalette.light.textPrimary,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      bodySmall: Typography.englishLike2021.bodySmall?.copyWith(
        height: 1.5,
        letterSpacing: 0,
        color: ColorPalette.light.textPrimary,
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: Typography.englishLike2021.bodyMedium?.copyWith(
        height: 1.5,
        letterSpacing: 0,
        color: ColorPalette.light.textPrimary,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      bodyLarge: Typography.englishLike2021.bodyLarge?.copyWith(
        height: 1.5,
        letterSpacing: 0,
        color: ColorPalette.light.textPrimary,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      headlineSmall: Typography.englishLike2021.headlineSmall?.copyWith(
        height: 1.5,
        letterSpacing: 0,
        color: ColorPalette.light.textPrimary,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      headlineMedium: Typography.englishLike2021.headlineMedium?.copyWith(
        height: 1.5,
        letterSpacing: 0,
        color: ColorPalette.light.textPrimary,
        fontSize: 20,
        fontWeight: FontWeight.w400,
      ),
      headlineLarge: Typography.englishLike2021.headlineLarge?.copyWith(
        height: 1.5,
        letterSpacing: 0,
        color: ColorPalette.light.textPrimary,
        fontSize: 24,
        fontWeight: FontWeight.w400,
      ),
      displaySmall: Typography.englishLike2021.displaySmall?.copyWith(
        height: 1.5,
        letterSpacing: 0,
        color: ColorPalette.light.textPrimary,
        fontSize: 24,
        fontWeight: FontWeight.w500,
      ),
      displayMedium: Typography.englishLike2021.displayMedium?.copyWith(
        height: 1.5,
        letterSpacing: 0,
        color: ColorPalette.light.textPrimary,
        fontSize: 32,
        fontWeight: FontWeight.w400,
      ),
      displayLarge: Typography.englishLike2021.displayLarge?.copyWith(
        height: 1.5,
        letterSpacing: 0,
        color: ColorPalette.light.textPrimary,
        fontSize: 48,
        fontWeight: FontWeight.w400,
      ),
      titleSmall: Typography.englishLike2021.titleSmall?.copyWith(
        height: 1.5,
        letterSpacing: 0,
        color: ColorPalette.light.textPrimary,
        fontSize: 14,
        fontWeight: FontWeight.w700,
      ),
      titleMedium: Typography.englishLike2021.titleMedium?.copyWith(
        height: 1.5,
        letterSpacing: 0,
        color: ColorPalette.light.textPrimary,
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),
      titleLarge: Typography.englishLike2021.titleLarge?.copyWith(
        height: 1.5,
        letterSpacing: 0,
        color: ColorPalette.light.textPrimary,
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),
    ).apply(),
  );

  static final ThemeData dark = ThemeData(
    useMaterial3: true,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.dark,
    hoverColor: Colors.transparent,
    primaryColor: ColorPalette.dark.primary,
    splashColor: Colors.transparent,
    scaffoldBackgroundColor: ColorPalette.dark.scaffoldBackground,
    highlightColor: Colors.transparent,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(ColorPalette.light.primary),
        foregroundColor: MaterialStateProperty.all(Colors.white),
        elevation: MaterialStateProperty.all(0),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        textStyle: MaterialStateProperty.all(
          TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: ColorPalette.light.white,
          ),
        ),
      ),
    ),
    textTheme: TextTheme(
      labelSmall: Typography.englishLike2021.labelSmall?.copyWith(
        height: 1.5,
        letterSpacing: 0,
        color: ColorPalette.dark.textPrimary,
        fontSize: 10,
        fontWeight: FontWeight.w500,
      ),
      labelMedium: Typography.englishLike2021.labelMedium?.copyWith(
        height: 1.5,
        letterSpacing: 0,
        color: ColorPalette.dark.textPrimary,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
      labelLarge: Typography.englishLike2021.labelLarge?.copyWith(
        height: 1.5,
        letterSpacing: 0,
        color: ColorPalette.dark.textPrimary,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      bodySmall: Typography.englishLike2021.bodySmall?.copyWith(
        height: 1.5,
        letterSpacing: 0,
        color: ColorPalette.dark.textPrimary,
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: Typography.englishLike2021.bodyMedium?.copyWith(
        height: 1.5,
        letterSpacing: 0,
        color: ColorPalette.dark.textPrimary,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      bodyLarge: Typography.englishLike2021.bodyLarge?.copyWith(
        height: 1.5,
        letterSpacing: 0,
        color: ColorPalette.dark.textPrimary,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      headlineSmall: Typography.englishLike2021.headlineSmall?.copyWith(
        height: 1.5,
        letterSpacing: 0,
        color: ColorPalette.dark.textPrimary,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      headlineMedium: Typography.englishLike2021.headlineMedium?.copyWith(
        height: 1.5,
        letterSpacing: 0,
        color: ColorPalette.dark.textPrimary,
        fontSize: 20,
        fontWeight: FontWeight.w400,
      ),
      headlineLarge: Typography.englishLike2021.headlineLarge?.copyWith(
        height: 1.5,
        letterSpacing: 0,
        color: ColorPalette.dark.textPrimary,
        fontSize: 24,
        fontWeight: FontWeight.w400,
      ),
      displaySmall: Typography.englishLike2021.displaySmall?.copyWith(
        height: 1.5,
        letterSpacing: 0,
        color: ColorPalette.dark.textPrimary,
        fontSize: 24,
        fontWeight: FontWeight.w500,
      ),
      displayMedium: Typography.englishLike2021.displayMedium?.copyWith(
        height: 1.5,
        letterSpacing: 0,
        color: ColorPalette.dark.textPrimary,
        fontSize: 32,
        fontWeight: FontWeight.w400,
      ),
      displayLarge: Typography.englishLike2021.displayLarge?.copyWith(
        height: 1.5,
        letterSpacing: 0,
        color: ColorPalette.dark.textPrimary,
        fontSize: 48,
        fontWeight: FontWeight.w400,
      ),
      titleSmall: Typography.englishLike2021.titleSmall?.copyWith(
        height: 1.5,
        letterSpacing: 0,
        color: ColorPalette.dark.textPrimary,
        fontSize: 14,
        fontWeight: FontWeight.w700,
      ),
      titleMedium: Typography.englishLike2021.titleMedium?.copyWith(
        height: 1.5,
        letterSpacing: 0,
        color: ColorPalette.dark.textPrimary,
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),
      titleLarge: Typography.englishLike2021.titleLarge?.copyWith(
        height: 1.5,
        letterSpacing: 0,
        color: ColorPalette.dark.textPrimary,
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),
    ).apply(),
  );
}
