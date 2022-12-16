part of 'current_weather_cubit.dart';

abstract class CurrentWeatherState extends Equatable {
  const CurrentWeatherState();

  @override
  List<Object> get props => [];
}

class CurrentWeatherInitial extends CurrentWeatherState {}

class CurrentWeatherLoading extends CurrentWeatherState{}

class CurrentWeatherFailure extends CurrentWeatherState{
  final DefaultModel response;

  CurrentWeatherFailure({required this.response});
}

class CurrentWeatherSuccess extends CurrentWeatherState{
  final CurrentWeatherEntity response;

CurrentWeatherSuccess({required this.response});
}
