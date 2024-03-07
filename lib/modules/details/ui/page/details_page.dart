import 'package:flutter/material.dart';
import 'package:weather_app/modules/weather/data/models/weather_response.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({
    required this.weather,
    super.key,
  });

  final WeatherResponse weather;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Wind Speed : ${weather.wind?.speed}',
              ),
              Text(
                'Min Temp : ${((weather.main?.temp_min ?? 0) - 273.15).toInt()} C',
              ),
              Text(
                'Max Temp : ${((weather.main?.temp_max ?? 0) - 273.15).toInt()} C',
              ),
              Text(
                'Pressure : ${weather.main?.pressure ?? 0}',
              ),
              Text(
                'Humidity : ${weather.main?.humidity ?? 0}',
              ),
            ],
          ),
        ),
      );
}
