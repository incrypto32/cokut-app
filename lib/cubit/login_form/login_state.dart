part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginPhoneOTPSend extends LoginState {}

class LoginFailed extends LoginState {
  final String message;
  LoginFailed(this.message);
}

class LoginOtpAutoRetrievalTimeOut extends LoginState {
  final bool codeSent;
  LoginOtpAutoRetrievalTimeOut(this.codeSent);
}

class PhoneVerifcationFailed extends LoginState {
  final String message;
  PhoneVerifcationFailed(this.message);
}

class LoggedIn extends LoginState {}
