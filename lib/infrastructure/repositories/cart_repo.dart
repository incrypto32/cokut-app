import 'package:cokut/infrastructure/services/api.dart';
import 'package:cokut/models/cartItem.dart';
import 'package:cokut/models/meal.dart';
import 'package:cokut/models/order.dart';
import 'package:cokut/models/user.dart';
import 'package:cokut/utils/logger.dart';

class CartRepository {
  Api api = Api();
  Map<String, CartItem> cart = {};
  Address _deliveryAddress;
  List<Order> orders = [];
  String rid = "";

  clear() {
    cart = {};
    _deliveryAddress = null;
    rid = "";
  }

  Map<String, CartItem> incrementItem(Meal meal, {int number = 1}) {
    String id = meal.id;
    if (cart[id] != null) {
      cart[id].increment(number: number);
      return cart;
    } else {
      cart[id] = CartItem(meal);
      return cart;
    }
  }

  Map<String, CartItem> decrementItem(Meal meal) {
    String id = meal.id;
    if (cart[id] != null && cart[id].count != 1) {
      cart[id].decrement();
      return cart;
    } else {
      cart.remove(id);
      if (cart.length == 0) {
        rid = "";
      }
      return cart;
    }
  }

  int itemNumber() {
    int n = 0;
    cart.forEach((key, value) {
      n += value.count;
    });
    return n;
  }

  set deliveryAddress(Address address) {
    _deliveryAddress = address;
  }

  setDeliveryAddress(Address address) {
    _deliveryAddress = address;

    return _deliveryAddress;
  }

  Address get deliveryAddress => _deliveryAddress;

  double getCartPrice() {
    double n = 0.0;
    cart.forEach((key, value) {
      n += value.count * value.meal.displayPrice;
    });

    return n;
  }

  double getDeliveryPrice() {
    double n = 20.0;
    return n;
  }

  Future<Order> order(String token) async {
    var order = Order(
      items: cart.map((key, value) => MapEntry(key, value.count)),
      rid: rid,
      address: deliveryAddress,
    );
    var orderData = await api.order(order.toJson(), token);
    logger.i(orderData);
    print(orderData);
    return Order.fromJson(orderData["order"]);
  }
}
