import 'package:cokut/infrastructure/services/api.dart';
import 'package:cokut/models/user.dart';
import 'package:cokut/utils/logger.dart';
import 'package:flutter/foundation.dart';

class GetUserFailure implements Exception {}

class UserRepository {
  Api _api = Api();
  User user;

  // Get User
  Future<User> getUser(String token, {int i = 0}) async {
    try {
      var userData = await _api.getUser(token);
      user = User.fromJson(userData);
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
    user = User.fromJson(userData);
    return user;
  }

  // Add Address
  Future<User> addAddress(
      {@required String token, @required Address address}) async {
    var userData = await _api.addAddress(
      token: token,
      address: address.toJson(),
    );
    user = User.fromJson(userData);
    return user;
  }

  // Remove User
  Future<User> removeAddress(
      {@required String token, @required Address address}) async {
    var userData = await _api.removeAddress(
      token: token,
      address: address.toJson(),
    );
    user = User.fromJson(userData);
    return user;
  }
}
