import 'package:bloc/bloc.dart';
import 'package:cokut/infrastructure/repositories/cart_repo.dart';
import 'package:cokut/models/cartItem.dart';
import 'package:cokut/models/meal.dart';
import 'package:cokut/utils/logger.dart';
import 'package:flutter/cupertino.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepository _cartRepository;
  CartCubit(this._cartRepository) : super(Cart(_cartRepository.cart));

  void addToCart(BuildContext context, Meal meal) {
    if (_cartRepository.rid != "" && _cartRepository.rid != meal.rid) {
      return;
    }

    var cartItems = _cartRepository.incrementItem(meal);
    if (cartItems[meal.id].count == 1) {
      _cartRepository.rid = meal.rid;
      logger.i(_cartRepository.rid);
      emit(CartItemAdded(cartItems, meal.id));
    } else {
      emit(Cart(cartItems));
    }
  }

  void removFromCart(Meal meal) {
    var cartItems = _cartRepository.decrementItem(meal);
    if (cartItems[meal.id] == null) {
      _cartRepository.rid = "";
      emit(CartItemDeleted(cartItems, meal.id));
    } else {
      emit(Cart(cartItems));
    }
  }

  Map<String, CartItem> getCart() {
    try {
      logger.d("GET CART");
      print(_cartRepository.cart);
      return _cartRepository.cart;
    } catch (e) {
      return null;
    }
  }

  double getCartPrice() {
    return _cartRepository.getCartPrice();
  }

  double getDeliveryPrice() {
    return _cartRepository.getDeliveryPrice();
  }
}
