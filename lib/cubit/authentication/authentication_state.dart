part of 'authentication_cubit.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationLoading extends AuthenticationState {}

class Authenticated extends AuthenticationState {
  final User firebaseUser;
  const Authenticated(this.firebaseUser);
}

class UnAuthenticated extends AuthenticationState {}
