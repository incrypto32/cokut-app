import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
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

@JsonSerializable(nullable: false)
class Address {
  String title;
  String adl1;
  String adl2;
  String adl3;
  String zone;
  Address({
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
