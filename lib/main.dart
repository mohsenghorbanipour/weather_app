import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:weather_app/modules/auth/data/models/token_response.dart';
import 'package:weather_app/weather_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(
    TokenResponseAdapter(),
  );
  runApp(
    const WeatherApp(),
  );
}
