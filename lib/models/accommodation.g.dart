// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accommodation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Accommodation _$$_AccommodationFromJson(Map<String, dynamic> json) =>
    _$_Accommodation(
      id: json['id'] as String,
      imageUrl: json['imageUrl'] as String,
      title: json['title'] as String,
      shortDescription: json['shortDescription'] as String,
      longDescription: json['longDescription'] as String,
      location: json['location'] as String,
      postalCode: json['postalCode'] as String,
      price: json['price'] as int,
      categorization: json['categorization'] as int,
      capacity: json['capacity'] as int,
      accommodationType: json['accommodationType'] as String,
      freeCancelation: json['freeCancelation'] as bool,
    );

Map<String, dynamic> _$$_AccommodationToJson(_$_Accommodation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'imageUrl': instance.imageUrl,
      'title': instance.title,
      'shortDescription': instance.shortDescription,
      'longDescription': instance.longDescription,
      'location': instance.location,
      'postalCode': instance.postalCode,
      'price': instance.price,
      'categorization': instance.categorization,
      'capacity': instance.capacity,
      'accommodationType': instance.accommodationType,
      'freeCancelation': instance.freeCancelation,
    };
