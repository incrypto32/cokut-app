import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cokut/models/meal.dart';
import 'package:equatable/equatable.dart';
import 'package:cokut/infrastructure/repositories/auth_repo.dart';
import 'package:cokut/infrastructure/repositories/meals_repo.dart';

part 'meals_state.dart';

class MealsCubit extends Cubit<MealsState> {
  final MealsRepository _mealsRepository;
  final AuthenticationRepository _authenticationRepository;
  MealsCubit(this._mealsRepository, this._authenticationRepository)
      : super(MealsLoading());

  Future<void> getMeals(String rid) async {
    emit(MealsLoading());
    try {
      var token = (await _authenticationRepository.getToken());
      var meals = await _mealsRepository.getMeals(token, rid);
      emit(MealsLoaded(meals));
    } catch (e) {
      if (e is SocketException) {
        emit(MealsError("Please check your network connection"));
      } else {
        emit(MealsError(""));
      }
    }
  }
}
