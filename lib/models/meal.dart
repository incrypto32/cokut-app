import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'meal.freezed.dart';
part 'meal.g.dart';

@freezed
abstract class Meal with _$Meal {
  const Meal._();
  const factory Meal({
    String id,
    String name,
    double prize,
    @JsonKey(name: 'display_price', nullable: false) double displayPrize,
  }) = _Meal;

  factory Meal.fromJson(Map<String, dynamic> json) => _$MealFromJson(json);
}

enum MealType {
  regular,
  special,
  spicey,
}
