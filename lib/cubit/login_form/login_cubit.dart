import 'package:bloc/bloc.dart';
import 'package:cokut/infrastructure/repositories/auth_repo.dart';
import 'package:cokut/utils/logger.dart';
import 'package:equatable/equatable.dart';

part 'login_state.dart';

Map<String, dynamic> values = {"vid": "", "codeSent": true};

class LoginCubit extends Cubit<LoginState> {
  final AuthenticationRepository _authRepo;

  LoginCubit(this._authRepo) : super(LoginInitial());

  Future<void> signInWithGoogle() async {
    emit(LoginLoading());
    try {
      await _authRepo.logInWithGoogle();
    } catch (e) {
      logger.e(e);
      emit(LoginFailed("An error occured please try again"));
    }
  }

  Future<void> verifyPhone(String phoneNumber) async {
    values["codeSent"] = false;
    emit(LoginLoading());
    try {
      await _authRepo.verifyPhone(
        timeout: Duration(seconds: 5),
        phoneNumber: "+91" + phoneNumber,
        onVerificationFailed: onVerificationFailed,
        phoneCodeAutoRetrievalTimeout: phoneCodeAutoRetrievalTimeout,
        phoneCodeSent: phoneCodeSent,
      );
    } catch (e) {
      logger.e(e);
      emit(LoginFailed("An error occured please try again"));
    }
  }

  Future<void> verifyOtpManually(String smsCode) async {
    emit(LoginLoading());
    try {
      await _authRepo.manualOtpVerificationRegister(
        smsCode: smsCode,
        vid: values["vid"],
      );
    } catch (e) {
      emit(PhoneVerifcationFailed("Couldnt verify OTP"));
    }
  }

  void onVerificationFailed(String error) {
    logger.e(error);
    emit(
      PhoneVerifcationFailed("An error occured please try again"),
    );
  }

  void phoneCodeSent(String vid, int ftoken) {
    logger.i("phone code sent");
    values["codeSent"] = true;
    values["vid"] = vid;

    emit(LoginPhoneOTPSend());
  }

  void phoneCodeAutoRetrievalTimeout(String vid) {
    emit(LoginOtpAutoRetrievalTimeOut(values["codeSent"]));
  }

  @override
  Future<void> close() {
    logger.i("Login CUBIT CLOSED");
    return super.close();
  }
}
