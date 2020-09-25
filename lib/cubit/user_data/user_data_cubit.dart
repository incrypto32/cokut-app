import 'package:bloc/bloc.dart';
import 'package:cokut/infrastructure/repositories/auth_repo.dart';
import 'package:cokut/infrastructure/repositories/user_repo.dart';
import 'package:equatable/equatable.dart';

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
      var user = await _userRepository.registerUser(
        name: name,
        email: email,
        phone: phoneNumber,
      );

      if (user.registered) {
        emit(UserRegistered());
      } else {
        emit(UserNotRegistered());
      }
    } catch (e) {
      emit(UserRegistrationError());
    }
  }
}
