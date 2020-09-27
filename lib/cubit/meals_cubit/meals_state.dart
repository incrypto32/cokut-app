part of 'meals_cubit.dart';

abstract class MealsState extends Equatable {
  const MealsState();

  @override
  List<Object> get props => [];
}

class MealsLoading extends MealsState {}

class MealsLoaded extends MealsState {}

class MealsError extends MealsState {}
