import 'package:cokut/models/meal.dart';
import 'package:cokut/models/user.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order.freezed.dart';
part 'order.g.dart';

@freezed
abstract class Order with _$Order {
  const Order._();
  const factory Order({
    String id,
    String rid,
    String uid,
    Address address,
    Map<String, int> items,
    List<Summary> summary,
    String time,
    String name,
    double price,
    double total,
    @JsonKey(name: 'delivery_charge', nullable: false) double deliveryCharge,
  }) = _Order;

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
}

@freezed
abstract class Summary with _$Summary {
  const Summary._();
  const factory Summary({
    Meal meal,
    int count,
    double price,
  }) = _Summary;

  factory Summary.fromJson(Map<String, dynamic> json) =>
      _$SummaryFromJson(json);
}
