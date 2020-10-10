import 'package:cokut/infrastructure/services/api.dart';
import 'package:cokut/models/order.dart';
import 'package:cokut/models/user.dart';
import 'package:cokut/utils/logger.dart';
import 'package:flutter/foundation.dart';

class GetUserFailure implements Exception {}

class UserRepository {
  Api _api = Api();
  Map<String, dynamic> _userStore = {"user": User()};
  List<Order> orders = [];
  User get user => _userStore["user"];

  List<Address> get addressList =>
      ((_userStore["user"] as User).address ?? {}).values.toList();

  PlaceInfo get selectedPlace => _userStore["selectedPlace"];

  void setPlaceSelection(PlaceInfo address) {
    _userStore["selectedPlace"] = address;
  }

  clearOrders() {
    orders = [];
  }

  clearUser() {
    _userStore["user"] = User();
    orders = [];
  }

  Future<void> getOrders(String token, {int i = 0}) async {
    if (orders.length == 0) {
      var orderList = await _api.getOrders(token);
      orders = orderList.map((e) => Order.fromJson(e)).toList();
      logger.d(orders);
    }
  }

  // Get User
  Future<User> getUser(String token, {int i = 0}) async {
    try {
      print("called get User");
      var userData = await _api.getUser(token);

      _userStore["user"] = User.fromJson(userData);

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
    _userStore["user"] = User.fromJson(userData);
    return _userStore["user"];
  }

  // Add Address
  Future<User> addAddress(
      {@required String token, @required Address address}) async {
    var userData = await _api.addAddress(
      token: token,
      address: address.toJson(),
    );
    logger.d(userData);

    _userStore["user"] = User.fromJson(userData);
    logger.wtf((_userStore["user"] as User).toJson());
    return _userStore["user"];
  }

  // Remove User
  Future<User> removeAddress(
      {@required String token, @required Address address}) async {
    var userData = await _api.removeAddress(
      token: token,
      address: address.toJson(),
    );
    _userStore["user"] = User.fromJson(userData);
    return _userStore["user"];
  }
}
