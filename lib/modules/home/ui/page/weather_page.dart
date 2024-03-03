import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/core/components/shimmer_component.dart';
import 'package:weather_app/core/resources/assets/assets.dart';
import 'package:weather_app/core/router/routes.dart';
import 'package:weather_app/modules/home/bloc/weather_bloc.dart';
import 'package:weather_app/modules/home/ui/widgets/theme_switch_widget.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => WeatherBloc()..init(),
        lazy: false,
        builder: (context, child) => Scaffold(
          body: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const ThemeSwitchWidget(),
                  if (context.select<WeatherBloc, bool>((bloc) => bloc.loading))
                    const Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ShimmerComponent(
                            width: 120,
                            height: 30,
                          ),
                          ShimmerComponent(
                            width: 200,
                            height: 200,
                            margin: EdgeInsets.symmetric(vertical: 16),
                            radius: 200,
                          ),
                          ShimmerComponent(
                            width: 120,
                            height: 14,
                          ),
                          ShimmerComponent(
                            width: 120,
                            height: 14,
                            margin: EdgeInsets.symmetric(vertical: 8),
                          ),
                          ShimmerComponent(
                            width: 120,
                            height: 14,
                          ),
                        ],
                      ),
                    )
                  else if (context.select<WeatherBloc, bool>(
                      (bloc) => bloc.unableToGetData))
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Unable To Get Data From Server',
                          ),
                          TextButton(
                            onPressed: () {
                              Provider.of<WeatherBloc>(context, listen: false)
                                  .init();
                            },
                            child: const Text(
                              'Retry',
                            ),
                          )
                        ],
                      ),
                    )
                  else if (context.select<WeatherBloc, bool>(
                      (bloc) => bloc.unableToLocation))
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Unable To Get Location',
                          ),
                          TextButton(
                            onPressed: () {
                              Provider.of<WeatherBloc>(context, listen: false)
                                  .init();
                            },
                            child: const Text(
                              'Retry',
                            ),
                          )
                        ],
                      ),
                    )
                  else
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            context.select<WeatherBloc, String>((bloc) =>
                                '${bloc.weatherResponse?.sys?.country ?? ''} - ${bloc.weatherResponse?.name ?? ''}'),
                          ),
                          Lottie.asset(
                            Assets.splashAnimations,
                          ),
                          Text(
                            context.select<WeatherBloc, String>((bloc) =>
                                '${((bloc.weatherResponse?.main?.temp ?? 0) - 273.15).toInt()} C'),
                          ),
                          Text(
                            context.select<WeatherBloc, String>((bloc) =>
                                bloc.weatherResponse?.weather?.first.main ??
                                ''),
                          ),
                          Text(
                            context.select<WeatherBloc, String>((bloc) =>
                                bloc.weatherResponse?.weather?.first
                                    .description ??
                                ''),
                          ),
                          TextButton(
                            onPressed: () {
                              context.goNamed(
                                Routes.details,
                                extra: Provider.of<WeatherBloc>(context,
                                        listen: false)
                                    .weatherResponse,
                              );
                            },
                            child: const Text(
                              'show details',
                            ),
                          )
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      );
}
