part of 'order_cubit.dart';

abstract class OrderState extends Equatable {
  const OrderState();

  @override
  List<Object> get props => [];
}

class OrderInitial extends OrderState {}

class OrderLoading extends OrderState {}

class OrderSuccessful extends OrderState {
  final Order order;
  OrderSuccessful(this.order);
}

class OrderError extends OrderState {}
