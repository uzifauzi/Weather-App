import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'default_model.g.dart';

@JsonSerializable(createToJson: false, fieldRename: FieldRename.pascal)
class DefaultModel {
  final String? message;

  DefaultModel({this.message});

  factory DefaultModel.fromJson(Map<String, dynamic> json) =>
      _$DefaultModelFromJson(json);
}
