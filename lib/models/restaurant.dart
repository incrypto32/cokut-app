import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'restaurant.freezed.dart';
part 'restaurant.g.dart';

@freezed
abstract class Restaurant with _$Restaurant {
  const Restaurant._();
  const factory Restaurant({
    String id,
    String name,
    String phone,
    String address,
    String logo,
    String type,
    @Default(false) bool closed,
  }) = _Restaurant;

  factory Restaurant.fromJson(Map<String, dynamic> json) =>
      _$RestaurantFromJson(json);
}
