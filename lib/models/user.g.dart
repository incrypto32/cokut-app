// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) {
  return Address(
    title: json['title'] as String,
    adl1: json['adl1'] as String,
    adl2: json['adl2'] as String,
    adl3: json['adl3'] as String,
    zone: json['zone'] as String,
  );
}

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'title': instance.title,
      'adl1': instance.adl1,
      'adl2': instance.adl2,
      'adl3': instance.adl3,
      'zone': instance.zone,
    };

PlaceInfo _$PlaceInfoFromJson(Map<String, dynamic> json) {
  return PlaceInfo(
    name: json['name'] as String,
    details: json['details'] as String,
    latitude: (json['latitude'] as num).toDouble(),
    longitude: (json['longitude'] as num).toDouble(),
  );
}

Map<String, dynamic> _$PlaceInfoToJson(PlaceInfo instance) => <String, dynamic>{
      'name': instance.name,
      'details': instance.details,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };

_$_User _$_$_UserFromJson(Map<String, dynamic> json) {
  return _$_User(
    name: json['name'] as String,
    email: json['email'] as String,
    uid: json['uid'] as String,
    phone: json['phone'] as String,
    address: (json['address'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k, e == null ? null : Address.fromJson(e as Map<String, dynamic>)),
    ),
    registered: json['registered'] as bool,
  );
}

Map<String, dynamic> _$_$_UserToJson(_$_User instance) => <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'uid': instance.uid,
      'phone': instance.phone,
      'address': instance.address,
      'registered': instance.registered,
    };
