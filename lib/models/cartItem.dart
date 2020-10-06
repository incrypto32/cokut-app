import 'package:cokut/models/meal.dart';
import 'package:cokut/utils/logger.dart';

class CartItem {
  Meal meal;
  int count;

  CartItem increment() {
    ++count;
    logger.i(count);
    return this;
  }

  CartItem decrement() {
    count != 0 ? --count : print("");
    logger.i(count);
    return this;
  }

  CartItem(this.meal, {this.count = 1});
}
