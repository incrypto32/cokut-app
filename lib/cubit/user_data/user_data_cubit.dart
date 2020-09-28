import 'dart:async';
import 'dart:io';

import 'package:cokut/common/exceptions.dart';
import 'package:cokut/utils/logger.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';

import 'package:cokut/infrastructure/repositories/auth_repo.dart';
import 'package:cokut/infrastructure/repositories/user_repo.dart';

part 'user_data_state.dart';

class UserDataCubit extends Cubit<UserDataState> {
  final UserRepository _userRepository;
  final AuthenticationRepository _authenticationRepository;

  UserDataCubit(this._userRepository, this._authenticationRepository)
      : super(UserDataLoading()) {
    getUser();
  }

  Future<void> getUser() async {
    emit(UserDataLoading());
    try {
      var user = await _userRepository.getUser(
        (await _authenticationRepository.getToken()),
      );
      if (user.registered) {
        emit(UserRegistered());
      } else {
        emit(UserNotRegistered());
      }
    } catch (e) {
      emit(UserDataError());
    }
  }

  Future<void> registUser(
      {String name, String email, String phoneNumber, String gid}) async {
    emit(UserRegisterLoading());

    try {
      await _userRepository.registerUser(
        token: (await _authenticationRepository.getToken()),
        name: name,
        email: email,
        phone: phoneNumber,
      );

      getUser();
    } catch (e) {
      logger.e(e);
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
    }
  }
}
