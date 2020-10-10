import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cokut/common/exceptions.dart';
import 'package:cokut/infrastructure/repositories/auth_repo.dart';
import 'package:cokut/infrastructure/repositories/user_repo.dart';
import 'package:cokut/models/user.dart';
import 'package:cokut/utils/logger.dart';
import 'package:cokut/utils/utils.dart';
import 'package:flutter/material.dart';
part 'address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  final UserRepository userRepository;
  final AuthenticationRepository authenticationRepository;
  AddressCubit({this.userRepository, this.authenticationRepository})
      : super(AddressPickerInitial()) {
    userRepository.setPlaceSelection(null);
    emit(AddressPickerLoading());
  }

  void selectPlace(PlaceInfo placeinfo) {
    userRepository.setPlaceSelection(placeinfo);
    emit(AddressPickerPicked());
  }

  Future<void> addAddress(BuildContext context, Address address,
      GlobalKey<FormState> _formKey) async {
    try {
      if (_formKey.currentState.validate()) {
        emit(AddressDataLoading());
        if (userRepository.selectedPlace != null) {
          address.placeInfo = userRepository.selectedPlace;
        } else {
          Utils.showWarning(context, content: "Please pick a place in the map");
          return;
        }

        await userRepository.addAddress(
          token: (await authenticationRepository.getToken()),
          address: address,
        );

        emit(AddressDataChange());
      }
    } catch (e) {
      logger.e(e.toString());
      if (e is SocketException) {
        emit(AddressUpdateError("Please check your network connection"));
      } else if (e is CustomException) {
        Utils.showWarning(context, content: e.message);
        emit(AddressUpdateError("An error occured please try again"));
      } else {
        emit(AddressUpdateError("An error occured please try again"));
      }
    }
  }

  Future<void> deleteAddress(Address address) async {
    try {
      emit(AddressDataLoading());
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
}
