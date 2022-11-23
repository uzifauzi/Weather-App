import 'package:dartz/dartz.dart';
import 'package:weather_app/core/usecase/usecase.dart';
import 'package:weather_app/data/models/default_model.dart';
import 'package:weather_app/data/models/location_body.dart';
import 'package:weather_app/data/repositories/weather_repository_impl.dart';
import 'package:weather_app/domain/entities/location_entity.dart';
import 'package:weather_app/domain/repositories/weather_repository.dart';

class GetLocationUseCase extends UseCase<LocationEntity, LocationBody> {
  final WeatherRepository weatherRepository;

  GetLocationUseCase(this.weatherRepository);
  @override
  Future<Either<DefaultModel, LocationEntity>> call(params){
    return weatherRepository.getLocation(params);
  }
}
