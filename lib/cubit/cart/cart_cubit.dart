import 'package:bloc/bloc.dart';
import 'package:cokut/infrastructure/repositories/cart_repo.dart';
import 'package:cokut/models/cartItem.dart';
import 'package:cokut/models/meal.dart';
import 'package:equatable/equatable.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepositoryMock123 _cartRepository;
  CartCubit(this._cartRepository) : super(CartInitial());

  void addToCart(Meal meal) {
    emit(CartChanged(_cartRepository.incrementItem(meal)));
  }

  void removFromCart(Meal meal) {
    emit(CartChanged(_cartRepository.decrementItem(meal)));
  }
}
