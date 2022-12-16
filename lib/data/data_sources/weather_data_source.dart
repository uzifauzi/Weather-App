import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/core/network/dio_config.dart';
import 'package:weather_app/data/models/current_weather_model.dart';
import 'package:weather_app/data/models/location_body.dart';
import 'package:weather_app/data/models/location_model.dart';
import 'package:weather_app/domain/entities/current_weather_entity.dart';
import 'package:weather_app/domain/entities/location_entity.dart';

abstract class WeatherDataSource {
  Future<LocationEntity> getLocation(LocationBody body);
  Future<CurrentWeatherEntity> getCurrentWeather(String locationKey);
}

class WeatherDataSourceImpl implements WeatherDataSource {
  final Dio dio;

  WeatherDataSourceImpl(this.dio);

  @override
  Future<LocationEntity> getLocation(LocationBody params) async {
    try {
      final response = await dio.get(
        '/locations/v1/cities/geoposition/search',
        queryParameters: params.toJson(),
      );
      log(response.toString());
      return LocationModel.fromJson(response.data as Map<String, dynamic>);
    } on DioError catch (e) {
      if (e.response != null) {
        log('${e.response?.statusCode}');
      }
      throw Exception(e.response);
    }
  }
  
  @override
  Future<CurrentWeatherEntity> getCurrentWeather(String locationKey) async {
    try {
      final response = await dio.get(
        '/currentconditions/v1/$locationKey',
      );
      log(response.toString());
      return CurrentWeatherModel.fromJson(response.data as Map<String, dynamic>);
    } on DioError catch (e) {
      if (e.response != null) {
        log('${e.response?.statusCode}');
      }
      throw Exception(e.response);
    }
  }


}
