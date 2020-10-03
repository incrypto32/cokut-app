import 'package:cokut/models/meal.dart';
import 'package:cokut/utils/logger.dart';

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
