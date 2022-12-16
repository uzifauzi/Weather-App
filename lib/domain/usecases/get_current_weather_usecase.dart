import 'package:dartz/dartz.dart';
import 'package:weather_app/core/usecase/usecase.dart';
import 'package:weather_app/data/models/default_model.dart';
import 'package:weather_app/domain/entities/current_weather_entity.dart';
import 'package:weather_app/domain/repositories/weather_repository.dart';

class GetCurrentWeatherUseCase extends UseCase<CurrentWeatherEntity, String> {
  final WeatherRepository weatherRepository;

  GetCurrentWeatherUseCase(this.weatherRepository);
  @override
  Future<Either<DefaultModel, CurrentWeatherEntity>> call(String params) {
    return weatherRepository.getCurrentWeather(params);
  }

}