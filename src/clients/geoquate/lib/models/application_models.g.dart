// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$_$_UserFromJson(Map<String, dynamic> json) {
  return _$_User(
    id: json['id'] as String,
    email: json['email'] as String?,
    defaultAddress: json['defaultAddress'] as String?,
  );
}

Map<String, dynamic> _$_$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'defaultAddress': instance.defaultAddress,
    };

_$_Address _$_$_AddressFromJson(Map<String, dynamic> json) {
  return _$_Address(
    id: json['id'] as String?,
    placeId: json['placeId'] as String,
    lattitude: (json['lattitude'] as num).toDouble(),
    longitute: (json['longitute'] as num).toDouble(),
    street: json['street'] as String?,
    city: json['city'] as String?,
    state: json['state'] as String?,
    postalCode: json['postalCode'] as String?,
  );
}

Map<String, dynamic> _$_$_AddressToJson(_$_Address instance) =>
    <String, dynamic>{
      'id': instance.id,
      'placeId': instance.placeId,
      'lattitude': instance.lattitude,
      'longitute': instance.longitute,
      'street': instance.street,
      'city': instance.city,
      'state': instance.state,
      'postalCode': instance.postalCode,
    };

_$_GeoQuate _$_$_GeoQuateFromJson(Map<String, dynamic> json) {
  return _$_GeoQuate(
    name: json['name'] as String,
    lattitude: (json['lattitude'] as num).toDouble(),
    longitute: (json['longitute'] as num).toDouble(),
  );
}

Map<String, dynamic> _$_$_GeoQuateToJson(_$_GeoQuate instance) =>
    <String, dynamic>{
      'name': instance.name,
      'lattitude': instance.lattitude,
      'longitute': instance.longitute,
    };

_$_PinInformation _$_$_PinInformationFromJson(Map<String, dynamic> json) {
  return _$_PinInformation(
    pinPath: json['pinPath'] as String?,
    avatarPath: json['avatarPath'] as String?,
    locationName: json['locationName'] as String,
    lat: (json['lat'] as num).toDouble(),
    long: (json['long'] as num).toDouble(),
    labelColor: json['labelColor'] as String?,
  );
}

Map<String, dynamic> _$_$_PinInformationToJson(_$_PinInformation instance) =>
    <String, dynamic>{
      'pinPath': instance.pinPath,
      'avatarPath': instance.avatarPath,
      'locationName': instance.locationName,
      'lat': instance.lat,
      'long': instance.long,
      'labelColor': instance.labelColor,
    };
