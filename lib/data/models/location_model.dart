import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/domain/entities/location_entity.dart';
part 'location_model.g.dart';

@JsonSerializable(createToJson: false, fieldRename: FieldRename.pascal)
class LocationModel extends LocationEntity {
  LocationModel(
      {required super.key, required ParentCityModel super.parentCity});

  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      _$LocationModelFromJson(json);
}

@JsonSerializable(createToJson: false, fieldRename: FieldRename.pascal)
class ParentCityModel extends ParentCityEntity {
  ParentCityModel({required super.localizedName});

  factory ParentCityModel.fromJson(Map<String, dynamic> json) =>
      _$ParentCityModelFromJson(json);
}
