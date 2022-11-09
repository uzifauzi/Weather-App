import 'package:equatable/equatable.dart';

class LocationEntity extends Equatable{
  final String key;
  final ParentCityEntity parentCity;

  LocationEntity({ required this.key, required this.parentCity});
  
  @override
  List<Object?> get props => [key, parentCity];
}

class ParentCityEntity extends Equatable {
  final String localizedName;

  ParentCityEntity({required this.localizedName});
  
  @override
  List<Object?> get props => [localizedName];
}