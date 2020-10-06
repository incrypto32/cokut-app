import 'dart:async';
import 'dart:io';

import 'package:cokut/common/exceptions.dart';
import 'package:cokut/infrastructure/repositories/cart_repo.dart';
import 'package:cokut/models/user.dart';
import 'package:cokut/utils/logger.dart';
import 'package:cokut/utils/utils.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';

import 'package:cokut/infrastructure/repositories/auth_repo.dart';
import 'package:cokut/infrastructure/repositories/user_repo.dart';
import 'package:flutter/cupertino.dart';

part 'user_data_state.dart';

class UserDataCubit extends Cubit<UserDataState> {
  final UserRepository userRepository;
  final Utils utils;

  final AuthenticationRepository authenticationRepository;
  final CartRepository cartRepository;

  UserDataCubit({
    @required this.userRepository,
    @required this.authenticationRepository,
    @required this.cartRepository,
    @required this.utils,
  }) : super(UserDataLoading()) {
    getUser();
  }

  Future<void> getUser() async {
    emit(UserDataLoading());
    try {
      var user = await userRepository.getUser(
        (await authenticationRepository.getToken()),
      );
      logger.d(user);
      Address address;
      if (userRepository.addressList != null &&
          userRepository.addressList.length != 0) {
        address = userRepository.addressList[0];
      }
      cartRepository
          .setDeliveryAddress(cartRepository.deliveryAddress ?? address);
      if (user.registered) {
        emit(UserRegistered());
      } else {
        emit(UserNotRegistered());
      }
    } catch (e) {
      logger.e(e);

      emit(UserDataError());
    }
  }

  Future<void> registerUser(
      {String name, String email, String phoneNumber, String gid}) async {
    emit(UserRegisterLoading());

    try {
      await userRepository.registerUser(
        token: (await authenticationRepository.getToken()),
        name: name,
        email: email,
        phone: phoneNumber,
      );

      getUser();
    } catch (e) {
      logger.e(e);
      print("ERRPR");
      if (e is DetailsExistException) {
        emit(
          UserRegistrationError(
            message:
                "Details you entered is already associated with another account",
          ),
        );
      } else if (e is SocketException) {
        emit(UserRegistrationError(message: e.message));
      }
      emit(UserRegistrationError(
          message: e.message == "DETAILS_EXIST"
              ? "An Account already exist with the provided details"
              : ""));
    }
  }

  Future<void> addAddress(Address address) async {
    try {
      emit(AddressLoading());
      await userRepository.addAddress(
        token: (await authenticationRepository.getToken()),
        address: address,
      );

      emit(AddressDataChange());
    } catch (e) {
      logger.e(e);
      if (e is SocketException) {
        emit(AddressUpdateError("Please check your network connection"));
      } else {
        emit(AddressUpdateError("An error occured please try again"));
      }
    }
  }

  Future<void> setPrimaryAddress(BuildContext context, Address address) async {
    try {
      emit(AddressLoading());

      Utils.showFlushBar(context, "Successfully set as primary address");
      emit(AddressDataChange());
    } catch (e) {
      logger.e(e);
      if (e is SocketException) {
        emit(AddressUpdateError("Please check your network connection"));
      } else {
        emit(AddressUpdateError("An error occured please try again"));
      }
    }
  }

  Future<void> deleteAddress(Address address) async {
    try {
      emit(AddressLoading());
      await userRepository.removeAddress(
        token: (await authenticationRepository.getToken()),
        address: address,
      );

      emit(AddressDataChange());
    } catch (e) {
      logger.e(e);
      if (e is SocketException) {
        emit(AddressUpdateError("Please check your network connection"));
      } else {
        emit(AddressUpdateError("An error occured please try again"));
      }
    }
  }

  Future<void> getOrders() {}
}
