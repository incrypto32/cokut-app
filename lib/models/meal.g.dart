// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Meal _$_$_MealFromJson(Map<String, dynamic> json) {
  return _$_Meal(
    id: json['id'] as String,
    rid: json['rid'] as String,
    name: json['name'] as String,
    price: (json['price'] as num)?.toDouble(),
    displayPrice: (json['display_price'] as num).toDouble(),
  );
}

Map<String, dynamic> _$_$_MealToJson(_$_Meal instance) => <String, dynamic>{
      'id': instance.id,
      'rid': instance.rid,
      'name': instance.name,
      'price': instance.price,
      'display_price': instance.displayPrice,
    };
