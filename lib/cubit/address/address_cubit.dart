import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cokut/infrastructure/repositories/auth_repo.dart';
import 'package:cokut/infrastructure/repositories/user_repo.dart';
import 'package:cokut/models/user.dart';
import 'package:equatable/equatable.dart';

part 'address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  final UserRepository _userRepository;
  final AuthenticationRepository _authRepository;

  AddressCubit(this._userRepository, this._authRepository)
      : super(AddressData(_userRepository.user.address));

  Future<void> addAddress(Address address) async {
    try {
      _userRepository.addAddress(
        token: (await _authRepository.getToken()),
        address: address,
      );
    } catch (e) {
      if (e is SocketException) {
        emit(AddressError("Please check your network connection"));
      } else {
        emit(AddressError("An error occured please try again"));
      }
    }
  }
}
