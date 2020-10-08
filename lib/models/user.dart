import 'package:cokut/utils/logger.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
part 'user.freezed.dart';
part 'user.g.dart';

@freezed
abstract class User with _$User {
  User._();
  factory User({
    String name,
    String email,
    String uid,
    String phone,
    Map<String, Address> address,
    bool registered,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@JsonSerializable(nullable: true)
class Address {
  PlaceInfo placeInfo;
  String title;
  String adl1;
  String adl2;
  String adl3;
  String zone;
  Address({
    this.placeInfo,
    this.title,
    this.adl1,
    this.adl2,
    this.adl3,
    this.zone,
  });
  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
  Map<String, dynamic> toJson() => _$AddressToJson(this);

  @override
  String toString() {
    var a = "${adl1}, ${adl2}, ${adl3},${zone}";
    return a;
  }
}

@JsonSerializable(nullable: true)
class PlaceInfo {
  String name;
  String details;
  double latitude;
  double longitude;

  PlaceInfo({
    this.name,
    this.details,
    this.latitude,
    this.longitude,
  });
  factory PlaceInfo.fromJson(Map<String, dynamic> json) =>
      _$PlaceInfoFromJson(json);
  factory PlaceInfo.fromPlacemarkAndCoordinates(
          Placemark placemark, LatLng latLng) =>
      _fromPmandCts(placemark, latLng);

  static PlaceInfo _fromPmandCts(Placemark placemark, LatLng latLng) {
    String details = "";
    logger.d(placemark.toJson());

    placemark.toJson().forEach((key, value) {
      if (value != null || value != "") {
        details += " " + value.toString();
      }
    });

    return PlaceInfo(
      name: placemark.locality ?? placemark.street,
      latitude: latLng.latitude,
      longitude: latLng.longitude,
      details: details,
    );
  }

  Map<String, dynamic> toJson() => _$PlaceInfoToJson(this);
}
