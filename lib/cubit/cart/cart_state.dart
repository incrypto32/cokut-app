part of 'cart_cubit.dart';

abstract class CartState {
  final Map<String, CartItemMock123> cartItems;
  const CartState(this.cartItems);
}

class Cart extends CartState {
  final Map<String, CartItemMock123> cartItems;
  const Cart(this.cartItems) : super(cartItems);
}

class CartItemDeleted extends CartState {
  final Map<String, CartItemMock123> cartItems;
  final String id;
  const CartItemDeleted(this.cartItems, this.id) : super(cartItems);
}

class CartItemAdded extends CartState {
  final Map<String, CartItemMock123> cartItems;
  final String id;
  const CartItemAdded(this.cartItems, this.id) : super(cartItems);
}
