part of 'meals_cubit.dart';

abstract class MealsState extends Equatable {
  const MealsState();

  @override
  List<Object> get props => [];
}

class MealsInitial extends MealsState {}

class MealsLoading extends MealsState {}

class MealsLoaded extends MealsState {
  final List<Meal> meals;
  const MealsLoaded(this.meals);
}

class MealsError extends MealsState {
  final String message;
  const MealsError(this.message);
}
