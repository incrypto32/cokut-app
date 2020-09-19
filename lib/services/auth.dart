import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  // Returns a User Stream
  Stream<User> authStream() {
    return _auth.authStateChanges();
  }

  // Current user
  currentUser() async {
    String token;
    try {
      if (_auth.currentUser != null) {
        token = await _auth.currentUser.getIdToken().catchError((e) {
          token = null;
        });
      }
      token = null;
    } catch (e) {
      print(e);
      token = null;
    }
    print(token);

    return token;
  }

  // Manual OTP Sign In
  manualOtpVerification(smsCode, verId) {
    AuthCredential authCreds =
        PhoneAuthProvider.credential(verificationId: verId, smsCode: smsCode);
    _auth.signInWithCredential(authCreds);
  }

  // Google SignIn
  Future<bool> signInWithGoogle() async {
    try {
      GoogleSignIn googleSignIn = GoogleSignIn();
      GoogleSignInAccount account = await googleSignIn.signIn();

      if (account == null) {
        return false;
      }

      UserCredential result = await _auth.signInWithCredential(
        GoogleAuthProvider.credential(
            accessToken: (await account.authentication).accessToken,
            idToken: (await account.authentication).idToken),
      );
      User user = result.user;
      print(user);

      if (user == null) {
        return false;
      }
      return true;
    } catch (e) {
      print(e.toString());
      print("error Google Sign In");
      return false;
    }
  }

  // Sign out
  Future<bool> signOut() async {
    try {
      await _auth.signOut();
      await googleSignIn.signOut();
      print("User Sign Out");
      return true;
    } catch (e) {
      print("error signout");
      print(e.toString());
      return false;
    }
  }

  // Phone Verification Logic
  Future<void> verifyPhone({
    @required String phoneNo,
    @required PhoneVerificationFailed verificationFailed,
    @required Function(String) autoTimeout,
    @required PhoneCodeSent codeSent,
    @required int forceResendToken,
    @required Function onVerfied,
    @required Function onError,
    Function register,
  }) async {
    print("Register is :");
    print(register);
    final PhoneVerificationCompleted verified = (AuthCredential authCreds) {
      print("Inside VERIFIFIED");
      Function f = () async {
        print("Inside F");
        onVerfied();
        try {
          print("Inside F TRY");
          bool val;
          if (register != null) {
            print("Inside F TRY Register mod");
            val = await register();
            print(val);
            if (val) {
              _auth.signInWithCredential(authCreds).then((uc) {
                uc.user.uid;
              });
            }
          }
        } catch (e) {
          print(e);
          onError();
        }
      };
      f();
    };

    await _auth.verifyPhoneNumber(
      forceResendingToken: forceResendToken ?? null,
      phoneNumber: phoneNo,
      timeout: const Duration(seconds: 60),
      verificationCompleted: verified,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: autoTimeout,
    );
  }
}

var authService = AuthService();
