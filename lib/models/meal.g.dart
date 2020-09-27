// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Meal _$_$_MealFromJson(Map<String, dynamic> json) {
  return _$_Meal(
    id: json['id'] as String,
    name: json['name'] as String,
    prize: (json['prize'] as num)?.toDouble(),
    displayPrize: (json['displayPrize'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$MealToJson(_$_Meal instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'prize': instance.prize,
      'displayPrize': instance.displayPrize,
    };
