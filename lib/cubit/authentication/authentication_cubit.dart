import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cokut/infrastructure/repositories/cart_repo.dart';
import 'package:cokut/infrastructure/repositories/user_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:cokut/infrastructure/repositories/auth_repo.dart';
import 'package:cokut/utils/logger.dart';
import 'package:flutter/foundation.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  final AuthenticationRepository _authenticationRepository;
  final CartRepository cartRepository;
  final UserRepository userRepository;
  StreamSubscription _userSubscription;
  AuthenticationCubit(this._authenticationRepository,
      {@required this.cartRepository, @required this.userRepository})
      : super(AuthenticationLoading()) {
    _userSubscription = _authenticationRepository.user.listen((user) {
      if (user == null) {
        cartRepository.clear();
        cartRepository.setDeliveryAddress(null);
        userRepository.clearUser();
      }
      getAuthState(user);
    });
  }

  @override
  Future<void> close() {
    logger.i("Authentication cubit closed");
    _userSubscription?.cancel();
    return super.close();
  }

  Future<void> getAuthState(User user) async {
    try {
      if (user != null) {
        logger.i("User logged In");
        emit(Authenticated(user));
      } else {
        cartRepository.clear();
        emit(UnAuthenticated());
      }
    } catch (e) {}
  }
}
