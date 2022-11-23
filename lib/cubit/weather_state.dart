part of 'weather_cubit.dart';

@immutable
abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherFailure extends WeatherState {
  final DefaultModel response;

  WeatherFailure({required this.response});
}

class WeatherSuccess extends WeatherState {
  final LocationEntity response;

  WeatherSuccess({required this.response});
}
