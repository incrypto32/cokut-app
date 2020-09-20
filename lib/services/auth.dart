import 'package:cokut/services/api.dart';
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
    print("inside current user");
    String token;
    try {
      print("test1");
      if (_auth.currentUser != null) {
        print("test 2");
        token = await _auth.currentUser.getIdToken().catchError((e) {
          token = null;
        });
        print("test 3");
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
  manualOtpVerificationRegister({
    smsCode,
    verId,
  }) async {
    AuthCredential authCreds = PhoneAuthProvider.credential(
      verificationId: verId,
      smsCode: smsCode,
    );

    return _auth.signInWithCredential(authCreds);
  }

  // Google SignIn
  Future<bool> signInWithGoogle() async {
    try {
      GoogleSignIn googleSignIn = GoogleSignIn();
      GoogleSignInAccount account = await googleSignIn.signIn();
      String gid = account.id;

      if (account == null) {
        return false;
      }

      bool val = (await api.checkUserByGID(gid: gid)) ?? false;

      if (!val) {
        var resp = await api.registerUser(
          name: account.displayName,
          email: account.email,
          phone: null,
        );
        if (resp != null) {
          if (resp["success"]) {
            print("Registration success");
          } else {
            return false;
          }
        }
      }

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
