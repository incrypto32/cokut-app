part of 'order_cubit.dart';

abstract class OrderState {
  const OrderState();
}

class OrderInitial extends OrderState {}

class OrderLoading extends OrderState {}

class OrderSuccessful extends OrderState {
  final Order order;
  OrderSuccessful(this.order);
}

class OrderError extends OrderState {}

class OrdersLoaded extends OrderState {}

class OrdersGetError extends OrderState {
  final String message;
  OrdersGetError(this.message);
}
