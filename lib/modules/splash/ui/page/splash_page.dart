import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/core/resources/assets/assets.dart';
import 'package:weather_app/core/router/routes.dart';
import 'package:weather_app/core/utils/logger_helper.dart';
import 'package:weather_app/modules/auth/bloc/auth_bloc.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    _initData();
    super.initState();
  }

  Future<void> _initData() async {
    try {
      AuthBloc().init().then(
        (_) async {
          AuthBloc().isAuthenticated().then(
            (isAuthenticated) async {
              if (isAuthenticated) {
                context.goNamed(
                  Routes.weather,
                );
              } else {
                context.goNamed(
                  Routes.login,
                );
              }
            },
          );
        },
      );
    } catch (e, s) {
      LoggerHelper.errorLog(e, s);
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.blue,
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LottieBuilder.asset(
                Assets.splashAnimations,
              ),
            ],
          ),
        ),
      );
}
