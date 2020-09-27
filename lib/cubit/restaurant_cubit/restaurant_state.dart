part of 'restaurant_cubit.dart';

abstract class RestaurantState extends Equatable {
  const RestaurantState();

  @override
  List<Object> get props => [];
}

class RestaurantLoading extends RestaurantState {}

class RestaurantsLoaded extends RestaurantState {
  final List<Restaurant> restaurants;
  const RestaurantsLoaded(this.restaurants);
}

class RestaurantsError extends RestaurantState {
  final String message;
  const RestaurantsError(this.message);
}
