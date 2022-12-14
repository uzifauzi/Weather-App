import 'package:json_annotation/json_annotation.dart';
part 'location_body.g.dart';

@JsonSerializable(createFactory: false)
class LocationBody {
  final String q;

  LocationBody({ required this.q});

  Map<String, dynamic> toJson() => _$LocationBodyToJson(this);
}
