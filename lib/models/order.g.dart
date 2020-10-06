// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Order _$_$_OrderFromJson(Map<String, dynamic> json) {
  return _$_Order(
    id: json['id'] as String,
    rid: json['rid'] as String,
    uid: json['uid'] as String,
    address: json['address'] == null
        ? null
        : Address.fromJson(json['address'] as Map<String, dynamic>),
    items: (json['items'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as int),
    ),
    summary: (json['summary'] as List)
        ?.map((e) =>
            e == null ? null : Summary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    time: json['time'] as String,
    name: json['name'] as String,
    price: (json['price'] as num)?.toDouble(),
    total: (json['total'] as num)?.toDouble(),
    deliveryCharge: (json['delivery_charge'] as num).toDouble(),
  );
}

Map<String, dynamic> _$_$_OrderToJson(_$_Order instance) => <String, dynamic>{
      'id': instance.id,
      'rid': instance.rid,
      'uid': instance.uid,
      'address': instance.address,
      'items': instance.items,
      'summary': instance.summary,
      'time': instance.time,
      'name': instance.name,
      'price': instance.price,
      'total': instance.total,
      'delivery_charge': instance.deliveryCharge,
    };

_$_Summary _$_$_SummaryFromJson(Map<String, dynamic> json) {
  return _$_Summary(
    meal: json['meal'] == null
        ? null
        : Meal.fromJson(json['meal'] as Map<String, dynamic>),
    count: json['count'] as int,
    price: (json['price'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$_$_SummaryToJson(_$_Summary instance) =>
    <String, dynamic>{
      'meal': instance.meal,
      'count': instance.count,
      'price': instance.price,
    };
