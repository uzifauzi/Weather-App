import 'package:dartz/dartz.dart';
import 'package:weather_app/data/models/location_body.dart';
import 'package:weather_app/domain/entities/current_weather_entity.dart';
import 'package:weather_app/domain/entities/location_entity.dart';

import '../../data/models/default_model.dart';
import '../../data/models/location_model.dart';

abstract class WeatherRepository {
  Future<Either<DefaultModel, LocationEntity>> getLocation(LocationBody params);
  Future<Either<DefaultModel, CurrentWeatherEntity>> getCurrentWeather(String locationKey);
}
