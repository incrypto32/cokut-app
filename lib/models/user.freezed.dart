// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
class _$UserTearOff {
  const _$UserTearOff();

// ignore: unused_element
  _User call(
      {String name,
      String email,
      String uid,
      String phone,
      Map<String, Address> address,
      bool registered}) {
    return _User(
      name: name,
      email: email,
      uid: uid,
      phone: phone,
      address: address,
      registered: registered,
    );
  }

// ignore: unused_element
  User fromJson(Map<String, Object> json) {
    return User.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $User = _$UserTearOff();

/// @nodoc
mixin _$User {
  String get name;
  String get email;
  String get uid;
  String get phone;
  Map<String, Address> get address;
  bool get registered;

  Map<String, dynamic> toJson();
  $UserCopyWith<User> get copyWith;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res>;
  $Res call(
      {String name,
      String email,
      String uid,
      String phone,
      Map<String, Address> address,
      bool registered});
}

/// @nodoc
class _$UserCopyWithImpl<$Res> implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  final User _value;
  // ignore: unused_field
  final $Res Function(User) _then;

  @override
  $Res call({
    Object name = freezed,
    Object email = freezed,
    Object uid = freezed,
    Object phone = freezed,
    Object address = freezed,
    Object registered = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed ? _value.name : name as String,
      email: email == freezed ? _value.email : email as String,
      uid: uid == freezed ? _value.uid : uid as String,
      phone: phone == freezed ? _value.phone : phone as String,
      address:
          address == freezed ? _value.address : address as Map<String, Address>,
      registered:
          registered == freezed ? _value.registered : registered as bool,
    ));
  }
}

/// @nodoc
abstract class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) then) =
      __$UserCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      String email,
      String uid,
      String phone,
      Map<String, Address> address,
      bool registered});
}

/// @nodoc
class __$UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(_User _value, $Res Function(_User) _then)
      : super(_value, (v) => _then(v as _User));

  @override
  _User get _value => super._value as _User;

  @override
  $Res call({
    Object name = freezed,
    Object email = freezed,
    Object uid = freezed,
    Object phone = freezed,
    Object address = freezed,
    Object registered = freezed,
  }) {
    return _then(_User(
      name: name == freezed ? _value.name : name as String,
      email: email == freezed ? _value.email : email as String,
      uid: uid == freezed ? _value.uid : uid as String,
      phone: phone == freezed ? _value.phone : phone as String,
      address:
          address == freezed ? _value.address : address as Map<String, Address>,
      registered:
          registered == freezed ? _value.registered : registered as bool,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_User extends _User with DiagnosticableTreeMixin {
  _$_User(
      {this.name,
      this.email,
      this.uid,
      this.phone,
      this.address,
      this.registered})
      : super._();

  factory _$_User.fromJson(Map<String, dynamic> json) =>
      _$_$_UserFromJson(json);

  @override
  final String name;
  @override
  final String email;
  @override
  final String uid;
  @override
  final String phone;
  @override
  final Map<String, Address> address;
  @override
  final bool registered;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'User(name: $name, email: $email, uid: $uid, phone: $phone, address: $address, registered: $registered)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'User'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('uid', uid))
      ..add(DiagnosticsProperty('phone', phone))
      ..add(DiagnosticsProperty('address', address))
      ..add(DiagnosticsProperty('registered', registered));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _User &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.uid, uid) ||
                const DeepCollectionEquality().equals(other.uid, uid)) &&
            (identical(other.phone, phone) ||
                const DeepCollectionEquality().equals(other.phone, phone)) &&
            (identical(other.address, address) ||
                const DeepCollectionEquality()
                    .equals(other.address, address)) &&
            (identical(other.registered, registered) ||
                const DeepCollectionEquality()
                    .equals(other.registered, registered)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(uid) ^
      const DeepCollectionEquality().hash(phone) ^
      const DeepCollectionEquality().hash(address) ^
      const DeepCollectionEquality().hash(registered);

  @override
  _$UserCopyWith<_User> get copyWith =>
      __$UserCopyWithImpl<_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UserToJson(this);
  }
}

abstract class _User extends User {
  _User._() : super._();
  factory _User(
      {String name,
      String email,
      String uid,
      String phone,
      Map<String, Address> address,
      bool registered}) = _$_User;

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  String get name;
  @override
  String get email;
  @override
  String get uid;
  @override
  String get phone;
  @override
  Map<String, Address> get address;
  @override
  bool get registered;
  @override
  _$UserCopyWith<_User> get copyWith;
}
