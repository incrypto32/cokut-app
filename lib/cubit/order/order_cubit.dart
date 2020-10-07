import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cokut/infrastructure/repositories/auth_repo.dart';
import 'package:cokut/infrastructure/repositories/cart_repo.dart';
import 'package:cokut/infrastructure/repositories/user_repo.dart';
import 'package:cokut/models/order.dart';
import 'package:cokut/utils/logger.dart';
import 'package:cokut/utils/utils.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  final CartRepository cartRepository;
  final AuthenticationRepository authenticationRepository;
  final UserRepository userRepository;

  OrderCubit(
      {@required this.cartRepository,
      @required this.authenticationRepository,
      @required this.userRepository})
      : super(OrderInitial());

  Future<void> placeOrder(Function callback) async {
    try {
      emit(OrderLoading());
      if (cartRepository.cart.length == 0) {
        emit(OrderError());
      }
      var order = await cartRepository
          .order((await authenticationRepository.getToken()));

      callback();
      userRepository.clearOrders();
      emit(OrderSuccessful(order));
    } catch (e) {
      logger.e(e);
      emit(OrderError());
    }
  }

  Future<void> getOrders() async {
    try {
      logger.d("GET ORDERS FIRED");
      emit(OrderLoading());
      await userRepository
          .getOrders((await authenticationRepository.getToken()));

      logger.d("GET ORDERS FINISHED");
      emit(OrdersLoaded());
    } catch (e) {
      logger.e(e);
      if (e is SocketException) {
        emit(OrdersGetError("Please check your network connection"));
      } else {
        logger.e("message");
        emit(OrdersGetError("An error occured please try again"));
      }
    }
  }
}
