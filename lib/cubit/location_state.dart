part of 'location_cubit.dart';
abstract class LocationState {}

class LocationInitial extends LocationState {}

class LocationLoading extends LocationState {}

class LocationFailure extends LocationState {
  final DefaultModel response;

  LocationFailure({required this.response});
}

class LocationSuccess extends LocationState {
  final LocationEntity response;

  LocationSuccess({required this.response});
}
