// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'restaurant.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Restaurant _$RestaurantFromJson(Map<String, dynamic> json) {
  return _Restaurant.fromJson(json);
}

/// @nodoc
class _$RestaurantTearOff {
  const _$RestaurantTearOff();

// ignore: unused_element
  _Restaurant call(
      {String id,
      String name,
      String phone,
      String address,
      String logo,
      String type}) {
    return _Restaurant(
      id: id,
      name: name,
      phone: phone,
      address: address,
      logo: logo,
      type: type,
    );
  }

// ignore: unused_element
  Restaurant fromJson(Map<String, Object> json) {
    return Restaurant.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $Restaurant = _$RestaurantTearOff();

/// @nodoc
mixin _$Restaurant {
  String get id;
  String get name;
  String get phone;
  String get address;
  String get logo;
  String get type;

  Map<String, dynamic> toJson();
  $RestaurantCopyWith<Restaurant> get copyWith;
}

/// @nodoc
abstract class $RestaurantCopyWith<$Res> {
  factory $RestaurantCopyWith(
          Restaurant value, $Res Function(Restaurant) then) =
      _$RestaurantCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String name,
      String phone,
      String address,
      String logo,
      String type});
}

/// @nodoc
class _$RestaurantCopyWithImpl<$Res> implements $RestaurantCopyWith<$Res> {
  _$RestaurantCopyWithImpl(this._value, this._then);

  final Restaurant _value;
  // ignore: unused_field
  final $Res Function(Restaurant) _then;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object phone = freezed,
    Object address = freezed,
    Object logo = freezed,
    Object type = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      name: name == freezed ? _value.name : name as String,
      phone: phone == freezed ? _value.phone : phone as String,
      address: address == freezed ? _value.address : address as String,
      logo: logo == freezed ? _value.logo : logo as String,
      type: type == freezed ? _value.type : type as String,
    ));
  }
}

/// @nodoc
abstract class _$RestaurantCopyWith<$Res> implements $RestaurantCopyWith<$Res> {
  factory _$RestaurantCopyWith(
          _Restaurant value, $Res Function(_Restaurant) then) =
      __$RestaurantCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String name,
      String phone,
      String address,
      String logo,
      String type});
}

/// @nodoc
class __$RestaurantCopyWithImpl<$Res> extends _$RestaurantCopyWithImpl<$Res>
    implements _$RestaurantCopyWith<$Res> {
  __$RestaurantCopyWithImpl(
      _Restaurant _value, $Res Function(_Restaurant) _then)
      : super(_value, (v) => _then(v as _Restaurant));

  @override
  _Restaurant get _value => super._value as _Restaurant;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object phone = freezed,
    Object address = freezed,
    Object logo = freezed,
    Object type = freezed,
  }) {
    return _then(_Restaurant(
      id: id == freezed ? _value.id : id as String,
      name: name == freezed ? _value.name : name as String,
      phone: phone == freezed ? _value.phone : phone as String,
      address: address == freezed ? _value.address : address as String,
      logo: logo == freezed ? _value.logo : logo as String,
      type: type == freezed ? _value.type : type as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Restaurant extends _Restaurant with DiagnosticableTreeMixin {
  const _$_Restaurant(
      {this.id, this.name, this.phone, this.address, this.logo, this.type})
      : super._();

  factory _$_Restaurant.fromJson(Map<String, dynamic> json) =>
      _$_$_RestaurantFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String phone;
  @override
  final String address;
  @override
  final String logo;
  @override
  final String type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Restaurant(id: $id, name: $name, phone: $phone, address: $address, logo: $logo, type: $type)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Restaurant'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('phone', phone))
      ..add(DiagnosticsProperty('address', address))
      ..add(DiagnosticsProperty('logo', logo))
      ..add(DiagnosticsProperty('type', type));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Restaurant &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.phone, phone) ||
                const DeepCollectionEquality().equals(other.phone, phone)) &&
            (identical(other.address, address) ||
                const DeepCollectionEquality()
                    .equals(other.address, address)) &&
            (identical(other.logo, logo) ||
                const DeepCollectionEquality().equals(other.logo, logo)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(phone) ^
      const DeepCollectionEquality().hash(address) ^
      const DeepCollectionEquality().hash(logo) ^
      const DeepCollectionEquality().hash(type);

  @override
  _$RestaurantCopyWith<_Restaurant> get copyWith =>
      __$RestaurantCopyWithImpl<_Restaurant>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_RestaurantToJson(this);
  }
}

abstract class _Restaurant extends Restaurant {
  const _Restaurant._() : super._();
  const factory _Restaurant(
      {String id,
      String name,
      String phone,
      String address,
      String logo,
      String type}) = _$_Restaurant;

  factory _Restaurant.fromJson(Map<String, dynamic> json) =
      _$_Restaurant.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get phone;
  @override
  String get address;
  @override
  String get logo;
  @override
  String get type;
  @override
  _$RestaurantCopyWith<_Restaurant> get copyWith;
}
