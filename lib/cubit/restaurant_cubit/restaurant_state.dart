part of 'restaurant_cubit.dart';

abstract class RestaurantState extends Equatable {
  const RestaurantState();

  @override
  List<Object> get props => [];
}

class RestaurantLoading extends RestaurantState {}

class RestaurantsLoaded extends RestaurantState {}

class RestaurantsError extends RestaurantState {
  final String message;
  const RestaurantsError(this.message);
}
