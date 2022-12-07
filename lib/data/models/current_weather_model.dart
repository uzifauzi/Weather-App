import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/domain/entities/current_weather_entity.dart';
part 'current_weather_model.g.dart';

@JsonSerializable(createToJson: false, fieldRename: FieldRename.pascal)
class CurrentWeatherModel extends CurrentWeatherEntity {
  CurrentWeatherModel(
      {required super.weatherText,
      required TemperatureModel super.temperatureEntity});

  factory CurrentWeatherModel.fromJson(Map<String, dynamic> json) =>
      _$CurrentWeatherModelFromJson(json);
}

@JsonSerializable(createToJson: false, fieldRename: FieldRename.pascal)
class TemperatureModel extends TemperatureEntity {
  TemperatureModel({required MetricModel super.metricEntity});

  factory TemperatureModel.fromJson(Map<String, dynamic> json) =>
      _$TemperatureModelFromJson(json);
}

@JsonSerializable(createToJson: false, fieldRename: FieldRename.pascal)
class MetricModel extends MetricEntity {
  MetricModel({required super.value, required super.unit});

  factory MetricModel.fromJson(Map<String, dynamic> json) =>
      _$MetricModelFromJson(json);
}
