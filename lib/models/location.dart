// ignore_for_file: depend_on_referenced_packages, invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'location.freezed.dart';
part 'location.g.dart';

@Freezed()
class Location with _$Location {
  @JsonSerializable(explicitToJson: true)
  const factory Location({
    required String id,
    required String locationName,
    required String postalCode,
    required String imageUrl,
    required int properties,
  }) = _Location;

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
}
