// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MainData _$MainDataFromJson(Map<String, dynamic> json) => MainData(
      temp: (json['temp'] as num?)?.toDouble(),
      feels_like: (json['feels_like'] as num?)?.toDouble(),
      temp_min: (json['temp_min'] as num?)?.toDouble(),
      temp_max: (json['temp_max'] as num?)?.toDouble(),
      pressure: (json['pressure'] as num?)?.toDouble(),
      humidity: (json['humidity'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$MainDataToJson(MainData instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('temp', instance.temp);
  writeNotNull('feels_like', instance.feels_like);
  writeNotNull('temp_min', instance.temp_min);
  writeNotNull('temp_max', instance.temp_max);
  writeNotNull('pressure', instance.pressure);
  writeNotNull('humidity', instance.humidity);
  return val;
}
