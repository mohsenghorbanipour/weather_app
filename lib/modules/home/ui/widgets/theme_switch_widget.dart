import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/core/blocs/theme_bloc.dart';
import 'package:weather_app/core/theme/style/color_palatte.dart';
import 'package:weather_app/core/theme/style/weather_theme.dart';
import 'package:weather_app/core/utils/logger_helper.dart';

class ThemeSwitchWidget extends StatelessWidget {
  const ThemeSwitchWidget({super.key});

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () {
          try {
            if (Provider.of<ThemeBloc>(context, listen: false).currentTheme ==
                theme.light) {
              Provider.of<ThemeBloc>(context, listen: false)
                  .setNewTheme(context, theme.dark.toString());
              SystemChrome.setSystemUIOverlayStyle(
                const SystemUiOverlayStyle(
                  statusBarColor: Colors.transparent,
                  statusBarIconBrightness: Brightness.light,
                ),
              );
            } else if (Provider.of<ThemeBloc>(context, listen: false)
                    .currentTheme ==
                theme.dark) {
              Provider.of<ThemeBloc>(context, listen: false)
                  .setNewTheme(context, theme.light.toString());
              SystemChrome.setSystemUIOverlayStyle(
                const SystemUiOverlayStyle(
                  statusBarColor: Colors.transparent,
                  statusBarIconBrightness: Brightness.dark,
                ),
              );
            } else if (Provider.of<ThemeBloc>(context, listen: false)
                    .currentTheme ==
                theme.system) {
              if (MediaQuery.of(context).platformBrightness ==
                  Brightness.light) {
                Provider.of<ThemeBloc>(context, listen: false)
                    .setNewTheme(context, theme.dark.toString());
                SystemChrome.setSystemUIOverlayStyle(
                  const SystemUiOverlayStyle(
                    statusBarColor: Colors.transparent,
                    statusBarIconBrightness: Brightness.light,
                  ),
                );
              } else {
                Provider.of<ThemeBloc>(context, listen: false)
                    .setNewTheme(context, theme.light.toString());
                SystemChrome.setSystemUIOverlayStyle(
                  const SystemUiOverlayStyle(
                    statusBarColor: Colors.transparent,
                    statusBarIconBrightness: Brightness.dark,
                  ),
                );
              }
            }
          } catch (e, s) {
            LoggerHelper.errorLog(e, s);
          }
        },
        child: Stack(
            alignment: context.select<ThemeBloc, bool>(
                    (bloc) => bloc.isThemeSelected(theme.light))
                ? Alignment.centerRight
                : Alignment.centerLeft,
            children: [
              Container(
                width: 45,
                height: 28,
                decoration: BoxDecoration(
                    color: ColorPalette.of(context).scaffoldBackground,
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                        color: WeatherTheme.isDark(context)
                            ? ColorPalette.of(context).primary
                            : ColorPalette.of(context).primary)),
              ),
              Container(
                width: 20,
                height: 20,
                margin: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorPalette.of(context).primary,
                ),
                child: Center(
                  child: Icon(
                    context.select<ThemeBloc, bool>(
                            (bloc) => bloc.isThemeSelected(theme.light))
                        ? Icons.sunny
                        : Icons.nightlight_round_sharp,
                    size: 14,
                  ),
                ),
              ),
            ]),
      );
}
