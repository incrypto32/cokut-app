part of 'cart_cubit.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartInitial extends CartState {}

class CartChanged extends CartState {
  final CartItemMock123 cartItem;
  const CartChanged(this.cartItem);
}
