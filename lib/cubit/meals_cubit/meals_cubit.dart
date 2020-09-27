import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'meals_state.dart';

class MealsCubit extends Cubit<MealsState> {
  MealsCubit() : super(MealsLoading());

  Future<void> getMeals() {}
}
