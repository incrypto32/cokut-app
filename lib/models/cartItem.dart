import 'package:cokut/models/meal.dart';
import 'package:cokut/utils/logger.dart';

class CartItem {
  String name;
  String hotel;
  double price;
  int count;
  CartItem(this.name, this.hotel, this.price, this.count);
}

class CartItemMock123 {
  Meal meal;
  int count;

  CartItemMock123 increment() {
    ++count;
    logger.i(count);
    return this;
  }

  CartItemMock123 decrement() {
    count != 0 ? --count : print("");
    logger.i(count);
    return this;
  }

  CartItemMock123(this.meal, {this.count = 1});
}
