import 'package:equatable/equatable.dart';

class MetricEntity extends Equatable {
  final String value;
  final String unit;

  MetricEntity({required this.value, required this.unit});

  @override
  // TODO: implement props
  List<Object?> get props => [value, unit];
}

class TemperatureEntity extends Equatable {
  final MetricEntity metricEntity;

  TemperatureEntity({required this.metricEntity});

  @override
  List<Object?> get props => [metricEntity];
}

class CurrentWeatherEntity extends Equatable {
  final String weatherText;
  final TemperatureEntity temperatureEntity;

  CurrentWeatherEntity(
      {required this.weatherText, required this.temperatureEntity});

  @override
  // TODO: implement props
  List<Object?> get props => [weatherText, temperatureEntity];
}
