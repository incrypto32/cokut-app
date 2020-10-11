import 'package:bloc/bloc.dart';
import 'package:cokut/infrastructure/repositories/cart_repo.dart';
import 'package:cokut/infrastructure/repositories/restaurant_repo.dart';
import 'package:cokut/models/cartItem.dart';
import 'package:cokut/models/meal.dart';
import 'package:cokut/utils/logger.dart';
import 'package:cokut/utils/utils.dart';
import 'package:flutter/cupertino.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepository _cartRepository;
  final RestaurantRepository restaurantRepository;
  CartCubit(this._cartRepository, {@required this.restaurantRepository})
      : super(Cart());

  void addToCart(BuildContext context, Meal meal) {
    if (_cartRepository.rid != "" && _cartRepository.rid != meal.rid) {
      Utils.showWarning(context,
          content: "Please remove items from other store.");
      return;
    }

    if (restaurantRepository.restaurants[meal.rid].closed) {
      Utils.showWarning(context,
          content: "The restaurant is currently closed please come back later");
      return;
    }

    var cartItems = _cartRepository.incrementItem(meal);
    if (cartItems[meal.id].count == 1) {
      _cartRepository.rid = meal.rid;
      logger.i(_cartRepository.rid);
      emit(CartItemAdded());
    } else {
      emit(Cart());
    }
  }

  void reorder(BuildContext context, List<Meal> meal) {
    if (restaurantRepository.restaurants[meal[0].rid].closed) {
      Utils.showWarning(context,
          content: "The restaurant is currently closed please come back later");
      return;
    }
  }

  void removFromCart(Meal meal) {
    var cartItems = _cartRepository.decrementItem(meal);
    if (cartItems[meal.id] == null) {
      _cartRepository.rid = "";
      emit(CartItemDeleted());
    } else {
      emit(Cart());
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

  clearCart() {
    _cartRepository.clear();
    emit(Cart());
  }

  double getCartPrice() {
    return _cartRepository.getCartPrice();
  }

  double getDeliveryPrice() {
    return _cartRepository.getDeliveryPrice();
  }
}
