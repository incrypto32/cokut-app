part of 'user_data_cubit.dart';

abstract class UserDataState extends Equatable {
  const UserDataState();

  @override
  List<Object> get props => [];
}

class UserDataLoading extends UserDataState {}

class UserRegistered extends UserDataState {}

class UserNotRegistered extends UserDataState {}

class UserDataError extends UserDataState {}

class UserRegisterLoading extends UserDataState {}

class UserRegistrationError extends UserDataState {
  final String message;
  UserRegistrationError({this.message});
}
