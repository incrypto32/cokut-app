import 'package:cokut/infrastructure/services/api.dart';
import 'package:cokut/models/order.dart';
import 'package:cokut/models/user.dart';
import 'package:cokut/utils/logger.dart';
import 'package:flutter/foundation.dart';

class GetUserFailure implements Exception {}

class UserRepository {
  Api _api = Api();
  Map<String, User> _user = {"user": User()};
  List<Order> orders = [];
  User get user => _user["user"];

  List<Address> get addressList =>
      (_user["user"].address ?? {}).values.toList();

  // Get User
  Future<User> getUser(String token, {int i = 0}) async {
    try {
      print("called get User");
      var userData = await _api.getUser(token);
      _user["user"] = User.fromJson(userData);
      print(userData);

      return User.fromJson(userData);
    } catch (e) {
      logger.e(e);
      throw GetUserFailure;
    }
  }

  Future<void> getOrders(String token, {int i = 0}) async {
    if (orders.length == 0) {
      var orderList = await _api.getOrders(token);
      orders = orderList.map((e) => Order.fromJson(e)).toList();
      logger.d(orders);
    }
  }

  clearOrders() {
    orders = [];
  }

  clearUser() {
    _user["user"] = User();
    orders = [];
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
  Future<User> addAddress(
      {@required String token, @required Address address}) async {
    var userData = await _api.addAddress(
      token: token,
      address: address.toJson(),
    );

    _user["user"] = User.fromJson(userData);
    logger.wtf(_user["user"]);
    return _user["user"];
  }

  // Remove User
  Future<User> removeAddress(
      {@required String token, @required Address address}) async {
    var userData = await _api.removeAddress(
      token: token,
      address: address.toJson(),
    );
    _user["user"] = User.fromJson(userData);
    return _user["user"];
  }
}
