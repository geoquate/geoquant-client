import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'application_models.freezed.dart';
part 'application_models.g.dart';

@freezed
class User with _$User {
  User._();

  factory User({
    required String id,
    String? email,
    String? defaultAddress,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  bool get hasAddress => defaultAddress?.isNotEmpty ?? false;
}

@freezed
abstract class Address with _$Address {
  factory Address({
    String? id,
    required String placeId,
    required double lattitude,
    required double longitute,
    String? street,
    String? city,
    String? state,
    String? postalCode,
  }) = _Address;

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
}

@freezed
class GeoQuate with _$GeoQuate {
  factory GeoQuate(
      {required String name,
      required double lattitude,
      required double longitute}) = _GeoQuate;

  factory GeoQuate.fromJson(Map<String, dynamic> json) =>
      _$GeoQuateFromJson(json);
}

@freezed
class PinInformation with _$PinInformation {
  factory PinInformation(
      {String? pinPath,
      String? avatarPath,
      required String locationName,
      required double lat,
      required double long,
      String? labelColor}) = _PinInformation;

  factory PinInformation.fromJson(Map<String, dynamic> json) =>
      _$PinInformationFromJson(json);
}
