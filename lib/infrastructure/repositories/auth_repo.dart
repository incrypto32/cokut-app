import 'package:cokut/utils/logger.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

/// Thrown during the sign in with google process if a failure occurs.
class LogInWithGoogleFailure implements Exception {}

/// Thrown during the sign in with google process if a failure occurs.
class PhoneAuthFailure implements Exception {
  final String message;
  PhoneAuthFailure(this.message);
}

/// Thrown during the logout process if a failure occurs.
class LogOutFailure implements Exception {}

class AuthenticationRepository {
  /// {@macro authentication_repository}
  AuthenticationRepository({
    FirebaseAuth firebaseAuth,
    GoogleSignIn googleSignIn,
  })  : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _googleSignIn = googleSignIn ?? GoogleSignIn.standard();

  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  Stream<User> get user {
    return _firebaseAuth.authStateChanges();
  }

  Future<String> getToken() {
    return _firebaseAuth.currentUser.getIdToken();
  }

  /// Starts the Sign In with Google Flow.
  ///
  /// Throws a [LogInWithEmailAndPasswordFailure] if an exception occurs.
  Future<void> logInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await _firebaseAuth.signInWithCredential(credential);
    } on Exception {
      throw LogInWithGoogleFailure();
    }
  }

  /// Starts the Sign In with Phone Verification Flow.
  ///
  /// Throws a [PhoneAuthFailure] if an exception occurs.
  Future<void> verifyPhone({
    @required String phoneNumber,
    @required void Function(String) onVerificationFailed,
    @required PhoneCodeSent phoneCodeSent,
    @required PhoneCodeAutoRetrievalTimeout phoneCodeAutoRetrievalTimeout,
    @required Duration timeout,
  }) async {
    PhoneVerificationFailed verificationFailed = (error) {
      debugPrint(error.message);
      onVerificationFailed(error.message);
    };

    PhoneVerificationCompleted verificationCompleted =
        (PhoneAuthCredential credential) {
      _firebaseAuth.signInWithCredential(credential);
    };

    try {
      await _firebaseAuth.verifyPhoneNumber(
        timeout: timeout,
        phoneNumber: phoneNumber,
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: phoneCodeSent,
        codeAutoRetrievalTimeout: phoneCodeAutoRetrievalTimeout,
      );
    } catch (e) {
      throw PhoneAuthFailure(e.toString());
    }
  }

  /// Starts the Sign In with Manual Otp Verification Flow.
  ///
  /// Throws a [PhoneAuthFailure] if an exception occurs.
  ///
  ///
  ///  // Manual OTP Sign In
  Future<void> manualOtpVerificationRegister({
    String smsCode,
    String vid,
  }) async {
    try {
      logger.d("smscode is $smsCode");
      logger.d("VID is $vid");

      AuthCredential authCreds = PhoneAuthProvider.credential(
        verificationId: vid,
        smsCode: smsCode,
      );

      await _firebaseAuth.signInWithCredential(authCreds);
    } catch (e) {
      logger.e(e);
      throw PhoneAuthFailure(e.toString());
    }
  }

  /// Signs out the current user which will emit
  /// [User.empty] from the [user] Stream.
  ///

  /// Throws a [LogOutFailure] if an exception occurs.
  Future<void> logOut() async {
    try {
      await Future.wait([
        _firebaseAuth.signOut(),
        _googleSignIn.signOut(),
      ]);
    } on Exception {
      throw LogOutFailure();
    }
  }
}
