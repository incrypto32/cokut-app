import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cokut/common/exceptions.dart';
import 'package:cokut/models/meal.dart';
import 'package:equatable/equatable.dart';
import 'package:cokut/infrastructure/repositories/auth_repo.dart';
import 'package:cokut/infrastructure/repositories/meals_repo.dart';

part 'meals_state.dart';

class MealsCubit extends Cubit<MealsState> {
  final MealsRepository _mealsRepository;
  final String rid;
  final MealType mealType;
  final AuthenticationRepository _authenticationRepository;
  MealsCubit(
    this._mealsRepository,
    this._authenticationRepository, {
    this.rid,
    this.mealType = MealType.regular,
  }) : super(MealsLoading()) {
    getMeals(rid: rid, mealType: mealType);
  }

  Future<void> getMeals({String rid, MealType mealType}) async {
    emit(MealsLoading());
    try {
      var token = (await _authenticationRepository.getToken());

      List<Meal> meals;

      switch (mealType) {
        case MealType.regular:
          {
            meals = await _mealsRepository.getMeals(token: token, rid: rid);
          }

          break;
        case MealType.special:
          {
            meals = await _mealsRepository.getSpecials(token: token);
          }
          break;
        case MealType.spicey:
          {
            meals = await _mealsRepository.getSpicey(token: token, rid: rid);
          }
          break;
        default:
          {
            meals = await _mealsRepository.getMeals(token: token, rid: rid);
          }
      }

      emit(MealsLoaded(meals));
    } catch (e) {
      if (e is SocketException) {
        emit(MealsError(e.message));
      } else if (e is CustomException) {
        emit(MealsError(e.message));
      } else {
        emit(MealsError("An error occured"));
      }
    }
  }
}
