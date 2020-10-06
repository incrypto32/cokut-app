import 'package:cokut/models/cartItem.dart';
import 'package:cokut/models/meal.dart';
import 'package:cokut/models/user.dart';

class CartRepository {
  Map<String, CartItem> cart = {};
  Address _deliveryAddress;
  String rid = "";

  clear() {
    cart = {};
    _deliveryAddress = null;
    rid = "";
  }

  Map<String, CartItem> incrementItem(Meal meal) {
    String id = meal.id;
    if (cart[id] != null) {
      cart[id].increment();
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
      n += value.count * value.meal.displayPrize;
    });

    return n;
  }

  double getDeliveryPrice() {
    double n = 20.0;
    return n;
  }
}
