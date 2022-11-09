// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationModel _$LocationModelFromJson(Map<String, dynamic> json) =>
    LocationModel(
      key: json['Key'] as String,
      parentCity:
          ParentCityModel.fromJson(json['ParentCity'] as Map<String, dynamic>),
    );

ParentCityModel _$ParentCityModelFromJson(Map<String, dynamic> json) =>
    ParentCityModel(
      localizedName: json['LocalizedName'] as String,
    );
