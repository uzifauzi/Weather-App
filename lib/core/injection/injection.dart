import 'package:get_it/get_it.dart';
import 'package:weather_app/core/network/dio_config.dart';
import 'package:weather_app/cubit/weather_cubit.dart';
import 'package:weather_app/data/data_sources/weather_data_source.dart';
import 'package:weather_app/data/repositories/weather_repository_impl.dart';
import 'package:weather_app/domain/repositories/weather_repository.dart';
import 'package:weather_app/domain/usecases/get_location_usecase.dart';

final di = GetIt.instance;

Future<void> init() async {
  di.registerFactory(() => WeatherCubit(di()));
  di.registerFactory(() => GetLocationUseCase(di()));
  di.registerFactory<WeatherRepository>(() => WeatherRepositoryImpl(di()));
  di.registerFactory<WeatherDataSource>(() => WeatherDataSourceImpl(di()));
  di.registerLazySingleton(() => dio);
}
