import 'package:cokut/infrastructure/services/api.dart';
import 'package:cokut/models/user.dart';
import 'package:cokut/utils/logger.dart';
import 'package:flutter/foundation.dart';

class GetUserFailure implements Exception {}

class UserRepository {
  Api _api = Api();
  Map<String, User> _user = {"user": User()};

  User get user => _user["user"];

  List<Address> get addressList =>
      (_user["user"].address ?? {}).values.toList();

  // Get User
  Future<User> getUser(String token, {int i = 0}) async {
    try {
      var userData = await _api.getUser(token);
      _user["user"] = User.fromJson(userData);
      logger.i(userData);
      logger.i(_user["user"]);
      return User.fromJson(userData);
    } catch (e) {
      logger.e(e);
      throw GetUserFailure;
    }
  }

  // Register User
  Future<User> registerUser({
    @required String token,
    @required String name,
    String email,
    String phone,
    String gid,
  }) async {
    var userData = await _api.registerUser(
      token: token,
      name: name,
      phone: phone,
      email: email,
      gid: gid,
    );
    _user["user"] = User.fromJson(userData);
    return _user["user"];
  }

  // Add Address
  Future<void> addAddress(
      {@required String token, @required Address address}) async {
    var userData = await _api.addAddress(
      token: token,
      address: address.toJson(),
    );

    _user["user"] = User.fromJson(userData);
    logger.wtf(_user["user"]);
  }

  // Remove User
  Future<void> removeAddress(
      {@required String token, @required Address address}) async {
    var userData = await _api.removeAddress(
      token: token,
      address: address.toJson(),
    );
    _user["user"] = User.fromJson(userData);
  }
}
