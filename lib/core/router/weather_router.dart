import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/core/router/routes.dart';
import 'package:weather_app/modules/auth/ui/page/login_page.dart';
import 'package:weather_app/modules/auth/ui/page/otp_page.dart';
import 'package:weather_app/modules/details/ui/page/details_page.dart';
import 'package:weather_app/modules/weather/data/models/weather_response.dart';
import 'package:weather_app/modules/weather/ui/page/weather_page.dart';
import 'package:weather_app/modules/splash/ui/page/splash_page.dart';

class WeatherRouter {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  late GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: Routes.splash,
    navigatorKey: navigatorKey,
    routes: <GoRoute>[
      _routeFade(
        path: Routes.splash,
        name: Routes.splash,
        pageBuilder: (state) => const SplashPage(),
      ),
      _routeFade(
        path: Routes.login,
        name: Routes.login,
        pageBuilder: (state) => LoginPage(),
        routes: [
          _routeFade(
            path: Routes.otp,
            name: Routes.otp,
            pageBuilder: (state) => OtpPage(),
          ),
        ],
      ),
      _routeFade(
        path: Routes.weather,
        name: Routes.weather,
        pageBuilder: (state) => const WeatherPage(),
        routes: [
          _routeFade(
            path: Routes.details,
            name: Routes.details,
            pageBuilder: (state) => DetailsPage(
              weather: state.extra as WeatherResponse,
            ),
          ),
        ],
      ),
    ],
  );

  GoRoute _routeFade(
          {required String path,
          required String name,
          required Widget Function(GoRouterState state) pageBuilder,
          List<GoRoute> routes = const []}) =>
      GoRoute(
        path: path,
        name: name,
        routes: routes,
        pageBuilder: (context, state) => (!kIsWeb && Platform.isIOS)
            ? CupertinoPage<void>(
                key: state.pageKey,
                restorationId: state.pageKey.value,
                child: pageBuilder(state),
              )
            : CustomTransitionPage<void>(
                key: state.pageKey,
                child: pageBuilder(state),
                restorationId: state.pageKey.value,
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) =>
                        FadeTransition(opacity: animation, child: child),
              ),
      );

  GoRoute _routeFromRight(
          {required String path,
          required String name,
          required Widget Function(GoRouterState state) pageBuilder,
          List<GoRoute> routes = const []}) =>
      GoRoute(
        path: path,
        name: name,
        routes: routes,
        pageBuilder: (context, state) => (!kIsWeb && Platform.isIOS)
            ? CupertinoPage<void>(
                key: state.pageKey,
                restorationId: state.pageKey.value,
                child: pageBuilder(state),
              )
            : CustomTransitionPage<void>(
                key: state.pageKey,
                child: pageBuilder(state),
                restorationId: state.pageKey.value,
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  var begin = const Offset(1.0, 0.0);
                  var end = Offset.zero;
                  var curve = Curves.ease;

                  var tween = Tween(begin: begin, end: end)
                      .chain(CurveTween(curve: curve));
                  return SlideTransition(
                      position: animation.drive(tween), child: child);
                },
              ),
      );
}
