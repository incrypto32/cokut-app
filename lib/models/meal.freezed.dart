// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'meal.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Meal _$MealFromJson(Map<String, dynamic> json) {
  return _Meal.fromJson(json);
}

/// @nodoc
class _$MealTearOff {
  const _$MealTearOff();

// ignore: unused_element
  _Meal call(
      {String id,
      String rid,
      String name,
      double prize,
      @JsonKey(name: 'display_price', nullable: false) double displayPrize}) {
    return _Meal(
      id: id,
      rid: rid,
      name: name,
      prize: prize,
      displayPrize: displayPrize,
    );
  }

// ignore: unused_element
  Meal fromJson(Map<String, Object> json) {
    return Meal.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $Meal = _$MealTearOff();

/// @nodoc
mixin _$Meal {
  String get id;
  String get rid;
  String get name;
  double get prize;
  @JsonKey(name: 'display_price', nullable: false)
  double get displayPrize;

  Map<String, dynamic> toJson();
  $MealCopyWith<Meal> get copyWith;
}

/// @nodoc
abstract class $MealCopyWith<$Res> {
  factory $MealCopyWith(Meal value, $Res Function(Meal) then) =
      _$MealCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String rid,
      String name,
      double prize,
      @JsonKey(name: 'display_price', nullable: false) double displayPrize});
}

/// @nodoc
class _$MealCopyWithImpl<$Res> implements $MealCopyWith<$Res> {
  _$MealCopyWithImpl(this._value, this._then);

  final Meal _value;
  // ignore: unused_field
  final $Res Function(Meal) _then;

  @override
  $Res call({
    Object id = freezed,
    Object rid = freezed,
    Object name = freezed,
    Object prize = freezed,
    Object displayPrize = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      rid: rid == freezed ? _value.rid : rid as String,
      name: name == freezed ? _value.name : name as String,
      prize: prize == freezed ? _value.prize : prize as double,
      displayPrize: displayPrize == freezed
          ? _value.displayPrize
          : displayPrize as double,
    ));
  }
}

/// @nodoc
abstract class _$MealCopyWith<$Res> implements $MealCopyWith<$Res> {
  factory _$MealCopyWith(_Meal value, $Res Function(_Meal) then) =
      __$MealCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String rid,
      String name,
      double prize,
      @JsonKey(name: 'display_price', nullable: false) double displayPrize});
}

/// @nodoc
class __$MealCopyWithImpl<$Res> extends _$MealCopyWithImpl<$Res>
    implements _$MealCopyWith<$Res> {
  __$MealCopyWithImpl(_Meal _value, $Res Function(_Meal) _then)
      : super(_value, (v) => _then(v as _Meal));

  @override
  _Meal get _value => super._value as _Meal;

  @override
  $Res call({
    Object id = freezed,
    Object rid = freezed,
    Object name = freezed,
    Object prize = freezed,
    Object displayPrize = freezed,
  }) {
    return _then(_Meal(
      id: id == freezed ? _value.id : id as String,
      rid: rid == freezed ? _value.rid : rid as String,
      name: name == freezed ? _value.name : name as String,
      prize: prize == freezed ? _value.prize : prize as double,
      displayPrize: displayPrize == freezed
          ? _value.displayPrize
          : displayPrize as double,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Meal extends _Meal with DiagnosticableTreeMixin {
  const _$_Meal(
      {this.id,
      this.rid,
      this.name,
      this.prize,
      @JsonKey(name: 'display_price', nullable: false) this.displayPrize})
      : super._();

  factory _$_Meal.fromJson(Map<String, dynamic> json) =>
      _$_$_MealFromJson(json);

  @override
  final String id;
  @override
  final String rid;
  @override
  final String name;
  @override
  final double prize;
  @override
  @JsonKey(name: 'display_price', nullable: false)
  final double displayPrize;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Meal(id: $id, rid: $rid, name: $name, prize: $prize, displayPrize: $displayPrize)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Meal'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('rid', rid))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('prize', prize))
      ..add(DiagnosticsProperty('displayPrize', displayPrize));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Meal &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.rid, rid) ||
                const DeepCollectionEquality().equals(other.rid, rid)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.prize, prize) ||
                const DeepCollectionEquality().equals(other.prize, prize)) &&
            (identical(other.displayPrize, displayPrize) ||
                const DeepCollectionEquality()
                    .equals(other.displayPrize, displayPrize)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(rid) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(prize) ^
      const DeepCollectionEquality().hash(displayPrize);

  @override
  _$MealCopyWith<_Meal> get copyWith =>
      __$MealCopyWithImpl<_Meal>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_MealToJson(this);
  }
}

abstract class _Meal extends Meal {
  const _Meal._() : super._();
  const factory _Meal(
      {String id,
      String rid,
      String name,
      double prize,
      @JsonKey(name: 'display_price', nullable: false)
          double displayPrize}) = _$_Meal;

  factory _Meal.fromJson(Map<String, dynamic> json) = _$_Meal.fromJson;

  @override
  String get id;
  @override
  String get rid;
  @override
  String get name;
  @override
  double get prize;
  @override
  @JsonKey(name: 'display_price', nullable: false)
  double get displayPrize;
  @override
  _$MealCopyWith<_Meal> get copyWith;
}
