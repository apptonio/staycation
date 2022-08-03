// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Location _$$_LocationFromJson(Map<String, dynamic> json) => _$_Location(
      id: json['id'] as String,
      locationName: json['locationName'] as String,
      postalCode: json['postalCode'] as String,
      imageUrl: json['imageUrl'] as String,
      properties: json['properties'] as int,
    );

Map<String, dynamic> _$$_LocationToJson(_$_Location instance) =>
    <String, dynamic>{
      'id': instance.id,
      'locationName': instance.locationName,
      'postalCode': instance.postalCode,
      'imageUrl': instance.imageUrl,
      'properties': instance.properties,
    };
