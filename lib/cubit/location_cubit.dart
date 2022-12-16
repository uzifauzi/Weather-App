import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/data/models/default_model.dart';
import 'package:weather_app/data/models/location_body.dart';
import 'package:weather_app/domain/entities/location_entity.dart';
import 'package:weather_app/domain/usecases/get_location_usecase.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit(this.getLocationUseCase) : super(LocationInitial());

  final GetLocationUseCase getLocationUseCase;

  Future<void> getLocation(LocationBody params) async {
    //ini awal, loading dulu
    emit(LocationLoading());

    //ponggil usecase, bisa gagal/bisa sukses
    final failureOrSuccess = await getLocationUseCase(params);

    //mengarahkan ke masing-masing state
    failureOrSuccess.fold(
      (l) => emit(LocationFailure(response: l)),
      (r) => emit(LocationSuccess(response: r)),
    );
  }
}
