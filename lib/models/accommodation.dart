
// ignore_for_file: depend_on_referenced_packages, invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'accommodation.freezed.dart';
part 'accommodation.g.dart';

@Freezed()
class Accommodation with _$Accommodation {
  @JsonSerializable(explicitToJson: true)
  const factory Accommodation({
    required String id,
    required String imageUrl,
    required String title,
    required String shortDescription,
    required String longDescription,
    required String location,
    required String postalCode,
    required int price,
    required int categorization,
    required int capacity,
    required String accommodationType,
    required bool freeCancelation,
  }) = _Accommodation;

  factory Accommodation.fromJson(Map<String, dynamic> json) =>
      _$AccommodationFromJson(json);
}
