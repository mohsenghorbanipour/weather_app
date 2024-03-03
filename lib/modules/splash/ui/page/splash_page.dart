import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/core/resources/assets/assets.dart';
import 'package:weather_app/core/router/routes.dart';
import 'package:weather_app/core/utils/logger_helper.dart';

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
      await Future.delayed(
        const Duration(seconds: 2),
      );
      if (context.mounted) {
        context.goNamed(Routes.weather);
      }
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
