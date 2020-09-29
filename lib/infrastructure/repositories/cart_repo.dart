import 'package:cokut/models/cartItem.dart';
import 'package:cokut/models/meal.dart';

class CartRepository {
  List<CartItem> cardItem = List<CartItem>();
  void initCartItem() {
    cardItem.add(CartItem("Biriyani", "Hotel A", 100.00, 1));
    cardItem.add(CartItem("Fried Rice", "Hotel b", 125.00, 1));
  }

  List<CartItem> getCartItems() {
    return cardItem;
  }

  void incrementCartItem(int index) {
    cardItem[index].count++;
  }

  void decrementCartItem(int index) {
    cardItem[index].count > 0 ? cardItem[index].count-- : 0;
  }
}

class CartRepositoryMock123 {
  Map<String, CartItemMock123> cart = {};
  printey() {
    cart.forEach((key, value) {
      print(value.count);
    });
  }

  Map<String, CartItemMock123> incrementItem(Meal meal) {
    String id = meal.id;
    if (cart[id] != null) {
      cart[id].increment();
      return cart;
    } else {
      cart[id] = CartItemMock123(meal);
      return cart;
    }
  }

  Map<String, CartItemMock123> decrementItem(Meal meal) {
    String id = meal.id;
    if (cart[id] != null && cart[id].count != 1) {
      cart[id].decrement();
      return cart;
    } else {
      cart.remove(id);
      return cart;
    }
  }

  double getCartPrice() {
    double n = 0.0;
    cart.forEach((key, value) {
      n += value.count * value.meal.displayPrize;
    });
    print(n);
    return n;
  }

  double getDeliveryPrice() {
    double n = 20.0;

    print(n);
    return n;
  }
}
