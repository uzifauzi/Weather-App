import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/data/models/current_weather_model.dart';
import 'package:weather_app/data/models/default_model.dart';
import 'package:weather_app/domain/entities/current_weather_entity.dart';
import 'package:weather_app/domain/usecases/get_current_weather_usecase.dart';

part 'current_weather_state.dart';

class CurrentWeatherCubit extends Cubit<CurrentWeatherState> {

  CurrentWeatherCubit(this.getCurrentWeatherUseCase) : super(CurrentWeatherInitial());
  final GetCurrentWeatherUseCase getCurrentWeatherUseCase;

  Future<void> getCurrentWeather(String locationKey) async{
    // pertama itu loading
    emit(CurrentWeatherLoading());

    //ponggil usecase, bisa gagal/bisa sukses
    final failureOrSuccess = await getCurrentWeatherUseCase(locationKey);

    //mengarahkan ke masing-masing state
    failureOrSuccess.fold(
      (l) => emit(CurrentWeatherFailure(response: l)),
      (r) => emit(CurrentWeatherSuccess(response: r)),
    );
  }

}
