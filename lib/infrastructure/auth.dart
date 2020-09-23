import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

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

        return token;
      }
      token = null;
    } catch (e) {
      print(e);
      token = null;
    }
    print(token);
    return token;
  }

  User user() {
    return _auth.currentUser;
  }

  // Manual OTP Sign In
  manualOtpVerification(smsCode, verId) {
    AuthCredential authCreds =
        PhoneAuthProvider.credential(verificationId: verId, smsCode: smsCode);
    _auth.signInWithCredential(authCreds);
  }

  // Manual OTP Sign In
  Future<bool> manualOtpVerificationRegister({
    smsCode,
    verId,
  }) async {
    try {
      AuthCredential authCreds = PhoneAuthProvider.credential(
        verificationId: verId,
        smsCode: smsCode,
      );
      var creds = await _auth.signInWithCredential(authCreds);
      if (creds != null && creds.user != null) {
        return true;
      }
    } catch (e) {
      print("Error occured in manualOTP Verfication");
      print(e);
      return false;
    }
    return false;
  }

  // Google SignIn
  Future<bool> signInWithGoogle() async {
    try {
      GoogleSignIn googleSignIn = GoogleSignIn();
      GoogleSignInAccount account = await googleSignIn.signIn();

      if (account == null) {
        return false;
      }

      // var resp = await api.registerUser(
      //   name: account.displayName,
      //   email: account.email,
      //   phone: null,
      //   gid: gid,
      // );

      // if (resp["success"]) {
      //   print("Registration success");
      // } else {
      //   return false;
      // }

      UserCredential result = await _auth.signInWithCredential(
        GoogleAuthProvider.credential(
            accessToken: (await account.authentication).accessToken,
            idToken: (await account.authentication).idToken),
      );

      if (result.user == null) {
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
    final PhoneVerificationCompleted verified =
        (AuthCredential authCreds) async {
      bool val;
      print("REGISTER IS");
      print(register);
      if (register != null) {
        try {
          val = await register();
        } catch (e) {
          print(e);
          onError();
        }
      }

      if (val ?? true) {
        _auth.signInWithCredential(authCreds).then((uc) {
          uc.user.uid;
        });
      }
    };
    print("__________________________________");
    print(phoneNo);
    await _auth.verifyPhoneNumber(
      forceResendingToken: forceResendToken ?? null,
      phoneNumber: "+91" + phoneNo,
      timeout: const Duration(seconds: 60),
      verificationCompleted: verified,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: autoTimeout,
    );
  }
}

var authService = AuthService();
