part of 'cart_cubit.dart';

abstract class CartState {
  final Map<String, CartItem> cartItems;
  const CartState(this.cartItems);
}

class Cart extends CartState {
  final Map<String, CartItem> cartItems;
  const Cart(this.cartItems) : super(cartItems);
}

class CartItemDeleted extends CartState {
  final Map<String, CartItem> cartItems;
  final String id;
  const CartItemDeleted(this.cartItems, this.id) : super(cartItems);
}

class CartItemAdded extends CartState {
  final Map<String, CartItem> cartItems;
  final String id;
  const CartItemAdded(this.cartItems, this.id) : super(cartItems);
}
