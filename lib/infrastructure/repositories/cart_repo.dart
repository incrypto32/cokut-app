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

  CartItemMock123 incrementItem(Meal meal) {
    String id = meal.id;
    if (cart[id] != null) {
      return cart[id].increment();
    } else {
      cart[id] = CartItemMock123(meal);
      return cart[id];
    }
  }

  CartItemMock123 decrementItem(Meal meal) {
    String id = meal.id;
    if (cart[id] != null) {
      return cart[id].decrement();
    } else {
      cart[id] = CartItemMock123(meal);
      return cart[id];
    }
  }
}
