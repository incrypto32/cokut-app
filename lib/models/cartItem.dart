import 'package:cokut/models/meal.dart';

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
    count++;
    return this;
  }

  CartItemMock123 decrement() {
    count++;
    return this;
  }

  CartItemMock123(this.meal, {this.count = 1});
}
