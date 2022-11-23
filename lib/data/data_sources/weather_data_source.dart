import 'package:dio/dio.dart';
import 'package:weather_app/core/network/dio_config.dart';
import 'package:weather_app/data/models/location_body.dart';
import 'package:weather_app/data/models/location_model.dart';
import 'package:weather_app/domain/entities/location_entity.dart';

abstract class WeatherDataSource {
  Future<LocationEntity> getLocation(LocationBody body);
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
    return LocationModel.fromJson(response as Map<String, dynamic>);
    } on DioError catch(e) {
      if (e.response!= null) {
        print(e.response?.statusCode);
      }
      throw Exception(e.response);
    }
  }
}
