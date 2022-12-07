// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentWeatherModel _$CurrentWeatherModelFromJson(Map<String, dynamic> json) =>
    CurrentWeatherModel(
      weatherText: json['WeatherText'] as String,
      temperatureEntity: TemperatureModel.fromJson(
          json['TemperatureEntity'] as Map<String, dynamic>),
    );

TemperatureModel _$TemperatureModelFromJson(Map<String, dynamic> json) =>
    TemperatureModel(
      metricEntity:
          MetricModel.fromJson(json['MetricEntity'] as Map<String, dynamic>),
    );

MetricModel _$MetricModelFromJson(Map<String, dynamic> json) => MetricModel(
      value: json['Value'] as String,
      unit: json['Unit'] as String,
    );
