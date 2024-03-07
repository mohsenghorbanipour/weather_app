import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:theme_provider/theme_provider.dart';
import 'package:weather_app/core/blocs/theme_bloc.dart';
import 'package:weather_app/core/constants/app_config.dart';
import 'package:weather_app/core/router/weather_router.dart';
import 'package:weather_app/core/theme/style/weather_theme.dart' as mytheme;
import 'package:weather_app/modules/auth/bloc/auth_bloc.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    final botToastBuilder = BotToastInit();
    return MultiProvider(
      providers: [
        // Global providers file
        Provider(
          lazy: false,
          create: (BuildContext context) => WeatherRouter(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => ThemeBloc(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => AuthBloc(),
        ),
      ],
      child: Builder(
        builder: (context) {
          return ThemeProvider(
            defaultThemeId: context.select<ThemeBloc, String>(
                (bloc) => bloc.currentThemeNoSystem.toString()),
            themes: [
              AppTheme(
                  id: mytheme.theme.light.toString(),
                  description: 'light theme',
                  data: mytheme.WeatherTheme.light),
              AppTheme(
                id: mytheme.theme.dark.toString(),
                description: 'dark theme',
                data: mytheme.WeatherTheme.dark,
              ),
            ],
            child: ThemeConsumer(
              child: Builder(builder: (context) {
                final GoRouter router =
                    Provider.of<WeatherRouter>(context, listen: false).router;
                return MaterialApp.router(
                  title: AppConfig.appName,
                  builder: (context, child) {
                    child = myBuilder(context, child);
                    child = botToastBuilder(context, child);
                    return child!;
                  },
                  routeInformationParser: router.routeInformationParser,
                  routerDelegate: router.routerDelegate,
                  routeInformationProvider: router.routeInformationProvider,
                  debugShowCheckedModeBanner: false,
                  theme: ThemeProvider.themeOf(context).data,
                );
              }),
            ),
          );
        },
      ),
    );
  }

  Widget? myBuilder(BuildContext context, Widget? child) => Builder(
        builder: (context) => MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: const TextScaler.linear(1),
          ),
          child: Builder(
            builder: (context) => Material(
              child: SafeArea(
                child: child ?? Container(),
              ),
            ),
          ),
        ),
      );
}
