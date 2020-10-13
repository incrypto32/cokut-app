import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cokut/common/exceptions.dart';
import 'package:cokut/infrastructure/repositories/meals_repo.dart';
import 'package:cokut/infrastructure/repositories/restaurant_repo.dart';
import 'package:cokut/models/meal.dart';
import 'package:cokut/models/restaurant.dart';
import 'package:cokut/utils/logger.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final RestaurantRepository restaurantRepository;
  final MealsRepository mealsRepository;
  String keyword;
  StreamSubscription streamSubscription;

  SearchCubit({
    @required this.restaurantRepository,
    @required this.mealsRepository,
  }) : super(SearchInitial());

  List<Restaurant> search(String keyword) {
    print("search");
    logger.d("search called with $keyword");

    List<Restaurant> results = restaurantRepository.restaurantsList
        .where(
          (element) =>
              element.name.toLowerCase().contains(keyword.toLowerCase()),
        )
        .toList();

    logger.i(results);
    // logger.d(restaurantRepository.restaurantsList);

    return results;
  }

  Future<void> searchMeals(String keyword) async {
    keyword = keyword;
    streamSubscription?.cancel();
    try {
      emit(SearchLoading());
      mealsRepository
          .search(keyword: keyword, token: "TEST_TOKEN")
          .asStream()
          .listen((mealList) {
        emit(SearchResults({"meals": mealList}));
      }).onError((e) {
        if (e is CustomException && e.code == 0) {
          emit(SearchError("No results", mealsEmpty: true));
        }
        emit(SearchError("An error occured"));
      });
    } catch (e) {
      emit(SearchError("Error"));
    }
  }
}
