import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/data/models/default_model.dart';
import 'package:weather_app/data/models/location_body.dart';
import 'package:weather_app/domain/entities/location_entity.dart';
import 'package:weather_app/domain/usecases/get_location_usecase.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.getLocationUseCase) : super(WeatherInitial());

  final GetLocationUseCase getLocationUseCase;

  Future<void> getLocation(LocationBody params) async {
    //ini awal, loading dulu
    emit(WeatherLoading());

    //ponggil usecase, bisa gagal/bisa sukses
    final failureOrSuccess = await getLocationUseCase(params);

    //mengarahkan ke masing-masing state
    failureOrSuccess.fold(
      (l) => emit(WeatherFailure(response: l)),
      (r) => emit(WeatherSuccess(response: r)),
    );
  }
}
