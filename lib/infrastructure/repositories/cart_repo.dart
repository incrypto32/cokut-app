import 'package:cokut/models/cartItem.dart';

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
