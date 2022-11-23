import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/data/data_sources/weather_data_source.dart';
import 'package:weather_app/data/models/location_model.dart';
import 'package:weather_app/data/models/location_body.dart';
import 'package:weather_app/data/models/default_model.dart';
import 'package:dartz/dartz.dart';
import 'package:weather_app/domain/entities/location_entity.dart';
import 'package:weather_app/domain/repositories/weather_repository.dart';

class WeatherRepositoryImpl extends WeatherRepository {
  final WeatherDataSource remoteDataSource;

  WeatherRepositoryImpl(this.remoteDataSource);
  @override
  Future<Either<DefaultModel, LocationEntity>> getLocation(
      LocationBody params) async {
    try {
      final getLocation = await remoteDataSource.getLocation(params);
      return Right(getLocation);
    } on DioError catch(e){
      return Left(DefaultModel.fromJson(e.response!.data));
    }
  }
}
