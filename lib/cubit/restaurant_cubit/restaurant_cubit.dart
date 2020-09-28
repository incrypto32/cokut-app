import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cokut/common/exceptions.dart';
import 'package:cokut/utils/logger.dart';
import 'package:equatable/equatable.dart';

import 'package:cokut/infrastructure/repositories/auth_repo.dart';
import 'package:cokut/infrastructure/repositories/restaurant_repo.dart';
import 'package:cokut/models/restaurant.dart';

part 'restaurant_state.dart';

class RestaurantCubit extends Cubit<RestaurantState> {
  final bool isHomeMade;
  final RestaurantRepository _restaurantRepository;
  final AuthenticationRepository _authenticationRepository;
  RestaurantCubit(this._restaurantRepository, this._authenticationRepository,
      {this.isHomeMade = false})
      : super(RestaurantLoading()) {
    getRestaurants();
  }

  Future<void> getRestaurants() async {
    emit(RestaurantLoading());
    try {
      var token = (await _authenticationRepository.getToken());
      var l = isHomeMade
          ? await _restaurantRepository.getHomeMadeStores(token)
          : await _restaurantRepository.getRestaurants(token);

      emit(RestaurantsLoaded(l));
    } catch (e) {
      logger.e(e);
      if (e is SocketException) {
        emit(RestaurantsError("Please check your network connection"));
      } else if (e is CustomException) {
        emit(RestaurantsError(e.message));
      } else {
        emit(RestaurantsError("An error occured"));
      }
    }
  }
}
