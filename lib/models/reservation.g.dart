// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Reservation _$$_ReservationFromJson(Map<String, dynamic> json) =>
    _$_Reservation(
      id: json['id'] as String,
      homesallId: json['homes-allId'] as String,
      fullName: json['fullName'] as String,
      email: json['email'] as String,
      numberOfGuests: json['numberOfGuests'] as int,
      checkIn: DateTime.parse(json['checkIn'] as String),
      checkOut: DateTime.parse(json['checkOut'] as String),
    );

Map<String, dynamic> _$$_ReservationToJson(_$_Reservation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'homes-allId': instance.homesallId,
      'fullName': instance.fullName,
      'email': instance.email,
      'numberOfGuests': instance.numberOfGuests,
      'checkIn': instance.checkIn.toIso8601String(),
      'checkOut': instance.checkOut.toIso8601String(),
    };
