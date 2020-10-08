// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Order _$OrderFromJson(Map<String, dynamic> json) {
  return _Order.fromJson(json);
}

/// @nodoc
class _$OrderTearOff {
  const _$OrderTearOff();

// ignore: unused_element
  _Order call(
      {String id,
      String rid,
      String uid,
      Address address,
      Map<String, int> items,
      List<Summary> summary,
      String time,
      String name,
      double price,
      double total,
      @JsonKey(name: 'delivery_charge', nullable: false)
          double deliveryCharge}) {
    return _Order(
      id: id,
      rid: rid,
      uid: uid,
      address: address,
      items: items,
      summary: summary,
      time: time,
      name: name,
      price: price,
      total: total,
      deliveryCharge: deliveryCharge,
    );
  }

// ignore: unused_element
  Order fromJson(Map<String, Object> json) {
    return Order.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $Order = _$OrderTearOff();

/// @nodoc
mixin _$Order {
  String get id;
  String get rid;
  String get uid;
  Address get address;
  Map<String, int> get items;
  List<Summary> get summary;
  String get time;
  String get name;
  double get price;
  double get total;
  @JsonKey(name: 'delivery_charge', nullable: false)
  double get deliveryCharge;

  Map<String, dynamic> toJson();
  $OrderCopyWith<Order> get copyWith;
}

/// @nodoc
abstract class $OrderCopyWith<$Res> {
  factory $OrderCopyWith(Order value, $Res Function(Order) then) =
      _$OrderCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String rid,
      String uid,
      Address address,
      Map<String, int> items,
      List<Summary> summary,
      String time,
      String name,
      double price,
      double total,
      @JsonKey(name: 'delivery_charge', nullable: false)
          double deliveryCharge});
}

/// @nodoc
class _$OrderCopyWithImpl<$Res> implements $OrderCopyWith<$Res> {
  _$OrderCopyWithImpl(this._value, this._then);

  final Order _value;
  // ignore: unused_field
  final $Res Function(Order) _then;

  @override
  $Res call({
    Object id = freezed,
    Object rid = freezed,
    Object uid = freezed,
    Object address = freezed,
    Object items = freezed,
    Object summary = freezed,
    Object time = freezed,
    Object name = freezed,
    Object price = freezed,
    Object total = freezed,
    Object deliveryCharge = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      rid: rid == freezed ? _value.rid : rid as String,
      uid: uid == freezed ? _value.uid : uid as String,
      address: address == freezed ? _value.address : address as Address,
      items: items == freezed ? _value.items : items as Map<String, int>,
      summary: summary == freezed ? _value.summary : summary as List<Summary>,
      time: time == freezed ? _value.time : time as String,
      name: name == freezed ? _value.name : name as String,
      price: price == freezed ? _value.price : price as double,
      total: total == freezed ? _value.total : total as double,
      deliveryCharge: deliveryCharge == freezed
          ? _value.deliveryCharge
          : deliveryCharge as double,
    ));
  }
}

/// @nodoc
abstract class _$OrderCopyWith<$Res> implements $OrderCopyWith<$Res> {
  factory _$OrderCopyWith(_Order value, $Res Function(_Order) then) =
      __$OrderCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String rid,
      String uid,
      Address address,
      Map<String, int> items,
      List<Summary> summary,
      String time,
      String name,
      double price,
      double total,
      @JsonKey(name: 'delivery_charge', nullable: false)
          double deliveryCharge});
}

/// @nodoc
class __$OrderCopyWithImpl<$Res> extends _$OrderCopyWithImpl<$Res>
    implements _$OrderCopyWith<$Res> {
  __$OrderCopyWithImpl(_Order _value, $Res Function(_Order) _then)
      : super(_value, (v) => _then(v as _Order));

  @override
  _Order get _value => super._value as _Order;

  @override
  $Res call({
    Object id = freezed,
    Object rid = freezed,
    Object uid = freezed,
    Object address = freezed,
    Object items = freezed,
    Object summary = freezed,
    Object time = freezed,
    Object name = freezed,
    Object price = freezed,
    Object total = freezed,
    Object deliveryCharge = freezed,
  }) {
    return _then(_Order(
      id: id == freezed ? _value.id : id as String,
      rid: rid == freezed ? _value.rid : rid as String,
      uid: uid == freezed ? _value.uid : uid as String,
      address: address == freezed ? _value.address : address as Address,
      items: items == freezed ? _value.items : items as Map<String, int>,
      summary: summary == freezed ? _value.summary : summary as List<Summary>,
      time: time == freezed ? _value.time : time as String,
      name: name == freezed ? _value.name : name as String,
      price: price == freezed ? _value.price : price as double,
      total: total == freezed ? _value.total : total as double,
      deliveryCharge: deliveryCharge == freezed
          ? _value.deliveryCharge
          : deliveryCharge as double,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Order extends _Order with DiagnosticableTreeMixin {
  const _$_Order(
      {this.id,
      this.rid,
      this.uid,
      this.address,
      this.items,
      this.summary,
      this.time,
      this.name,
      this.price,
      this.total,
      @JsonKey(name: 'delivery_charge', nullable: false) this.deliveryCharge})
      : super._();

  factory _$_Order.fromJson(Map<String, dynamic> json) =>
      _$_$_OrderFromJson(json);

  @override
  final String id;
  @override
  final String rid;
  @override
  final String uid;
  @override
  final Address address;
  @override
  final Map<String, int> items;
  @override
  final List<Summary> summary;
  @override
  final String time;
  @override
  final String name;
  @override
  final double price;
  @override
  final double total;
  @override
  @JsonKey(name: 'delivery_charge', nullable: false)
  final double deliveryCharge;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Order(id: $id, rid: $rid, uid: $uid, address: $address, items: $items, summary: $summary, time: $time, name: $name, price: $price, total: $total, deliveryCharge: $deliveryCharge)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Order'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('rid', rid))
      ..add(DiagnosticsProperty('uid', uid))
      ..add(DiagnosticsProperty('address', address))
      ..add(DiagnosticsProperty('items', items))
      ..add(DiagnosticsProperty('summary', summary))
      ..add(DiagnosticsProperty('time', time))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('price', price))
      ..add(DiagnosticsProperty('total', total))
      ..add(DiagnosticsProperty('deliveryCharge', deliveryCharge));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Order &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.rid, rid) ||
                const DeepCollectionEquality().equals(other.rid, rid)) &&
            (identical(other.uid, uid) ||
                const DeepCollectionEquality().equals(other.uid, uid)) &&
            (identical(other.address, address) ||
                const DeepCollectionEquality()
                    .equals(other.address, address)) &&
            (identical(other.items, items) ||
                const DeepCollectionEquality().equals(other.items, items)) &&
            (identical(other.summary, summary) ||
                const DeepCollectionEquality()
                    .equals(other.summary, summary)) &&
            (identical(other.time, time) ||
                const DeepCollectionEquality().equals(other.time, time)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.price, price) ||
                const DeepCollectionEquality().equals(other.price, price)) &&
            (identical(other.total, total) ||
                const DeepCollectionEquality().equals(other.total, total)) &&
            (identical(other.deliveryCharge, deliveryCharge) ||
                const DeepCollectionEquality()
                    .equals(other.deliveryCharge, deliveryCharge)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(rid) ^
      const DeepCollectionEquality().hash(uid) ^
      const DeepCollectionEquality().hash(address) ^
      const DeepCollectionEquality().hash(items) ^
      const DeepCollectionEquality().hash(summary) ^
      const DeepCollectionEquality().hash(time) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(price) ^
      const DeepCollectionEquality().hash(total) ^
      const DeepCollectionEquality().hash(deliveryCharge);

  @override
  _$OrderCopyWith<_Order> get copyWith =>
      __$OrderCopyWithImpl<_Order>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_OrderToJson(this);
  }
}

abstract class _Order extends Order {
  const _Order._() : super._();
  const factory _Order(
      {String id,
      String rid,
      String uid,
      Address address,
      Map<String, int> items,
      List<Summary> summary,
      String time,
      String name,
      double price,
      double total,
      @JsonKey(name: 'delivery_charge', nullable: false)
          double deliveryCharge}) = _$_Order;

  factory _Order.fromJson(Map<String, dynamic> json) = _$_Order.fromJson;

  @override
  String get id;
  @override
  String get rid;
  @override
  String get uid;
  @override
  Address get address;
  @override
  Map<String, int> get items;
  @override
  List<Summary> get summary;
  @override
  String get time;
  @override
  String get name;
  @override
  double get price;
  @override
  double get total;
  @override
  @JsonKey(name: 'delivery_charge', nullable: false)
  double get deliveryCharge;
  @override
  _$OrderCopyWith<_Order> get copyWith;
}

Summary _$SummaryFromJson(Map<String, dynamic> json) {
  return _Summary.fromJson(json);
}

/// @nodoc
class _$SummaryTearOff {
  const _$SummaryTearOff();

// ignore: unused_element
  _Summary call({Meal meal, int count, double price}) {
    return _Summary(
      meal: meal,
      count: count,
      price: price,
    );
  }

// ignore: unused_element
  Summary fromJson(Map<String, Object> json) {
    return Summary.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $Summary = _$SummaryTearOff();

/// @nodoc
mixin _$Summary {
  Meal get meal;
  int get count;
  double get price;

  Map<String, dynamic> toJson();
  $SummaryCopyWith<Summary> get copyWith;
}

/// @nodoc
abstract class $SummaryCopyWith<$Res> {
  factory $SummaryCopyWith(Summary value, $Res Function(Summary) then) =
      _$SummaryCopyWithImpl<$Res>;
  $Res call({Meal meal, int count, double price});

  $MealCopyWith<$Res> get meal;
}

/// @nodoc
class _$SummaryCopyWithImpl<$Res> implements $SummaryCopyWith<$Res> {
  _$SummaryCopyWithImpl(this._value, this._then);

  final Summary _value;
  // ignore: unused_field
  final $Res Function(Summary) _then;

  @override
  $Res call({
    Object meal = freezed,
    Object count = freezed,
    Object price = freezed,
  }) {
    return _then(_value.copyWith(
      meal: meal == freezed ? _value.meal : meal as Meal,
      count: count == freezed ? _value.count : count as int,
      price: price == freezed ? _value.price : price as double,
    ));
  }

  @override
  $MealCopyWith<$Res> get meal {
    if (_value.meal == null) {
      return null;
    }
    return $MealCopyWith<$Res>(_value.meal, (value) {
      return _then(_value.copyWith(meal: value));
    });
  }
}

/// @nodoc
abstract class _$SummaryCopyWith<$Res> implements $SummaryCopyWith<$Res> {
  factory _$SummaryCopyWith(_Summary value, $Res Function(_Summary) then) =
      __$SummaryCopyWithImpl<$Res>;
  @override
  $Res call({Meal meal, int count, double price});

  @override
  $MealCopyWith<$Res> get meal;
}

/// @nodoc
class __$SummaryCopyWithImpl<$Res> extends _$SummaryCopyWithImpl<$Res>
    implements _$SummaryCopyWith<$Res> {
  __$SummaryCopyWithImpl(_Summary _value, $Res Function(_Summary) _then)
      : super(_value, (v) => _then(v as _Summary));

  @override
  _Summary get _value => super._value as _Summary;

  @override
  $Res call({
    Object meal = freezed,
    Object count = freezed,
    Object price = freezed,
  }) {
    return _then(_Summary(
      meal: meal == freezed ? _value.meal : meal as Meal,
      count: count == freezed ? _value.count : count as int,
      price: price == freezed ? _value.price : price as double,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Summary extends _Summary with DiagnosticableTreeMixin {
  const _$_Summary({this.meal, this.count, this.price}) : super._();

  factory _$_Summary.fromJson(Map<String, dynamic> json) =>
      _$_$_SummaryFromJson(json);

  @override
  final Meal meal;
  @override
  final int count;
  @override
  final double price;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Summary(meal: $meal, count: $count, price: $price)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Summary'))
      ..add(DiagnosticsProperty('meal', meal))
      ..add(DiagnosticsProperty('count', count))
      ..add(DiagnosticsProperty('price', price));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Summary &&
            (identical(other.meal, meal) ||
                const DeepCollectionEquality().equals(other.meal, meal)) &&
            (identical(other.count, count) ||
                const DeepCollectionEquality().equals(other.count, count)) &&
            (identical(other.price, price) ||
                const DeepCollectionEquality().equals(other.price, price)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(meal) ^
      const DeepCollectionEquality().hash(count) ^
      const DeepCollectionEquality().hash(price);

  @override
  _$SummaryCopyWith<_Summary> get copyWith =>
      __$SummaryCopyWithImpl<_Summary>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SummaryToJson(this);
  }
}

abstract class _Summary extends Summary {
  const _Summary._() : super._();
  const factory _Summary({Meal meal, int count, double price}) = _$_Summary;

  factory _Summary.fromJson(Map<String, dynamic> json) = _$_Summary.fromJson;

  @override
  Meal get meal;
  @override
  int get count;
  @override
  double get price;
  @override
  _$SummaryCopyWith<_Summary> get copyWith;
}
