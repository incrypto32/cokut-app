import 'package:cokut/services/api.dart';
import 'package:cokut/services/auth.dart';
import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UtilsB {
  static showWarning({String content, @required BuildContext context}) {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text(
          content ?? "Please Check Your Internet Connectivity",
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  static showError(BuildContext context) {
    showWarning(
      context: context,
      content: "An error occured please try again",
    );
  }

  static void verifyPhone(
    BuildContext context, {
    @required String phone,
    String name,
    String email,
    @required Function(bool) setLoading,
    @required Function(int) setResetToken,
    @required Function onError,
    @required Function onVerified,
    @required Function(String) autoTimeOut,
    Function register,
    bool registration,
    int forceResendToken,
  }) {
    print("Inside VerifyPhone (utils)");
    print("Test 1");
    print("Register is :");
    print(register);
    authService.verifyPhone(
      phoneNo: "+91" + phone,
      verificationFailed: (error) {
        print("Test 2");
        print(error);
        Utils.showWarning(
          content: "An Error Occured Please Try Again",
          context: context,
        );
        setLoading(false);
      },
      forceResendToken: forceResendToken,
      codeSent: (vid, i) {
        print("Test 3");
        setResetToken(i);
        setLoading(false);
        if (forceResendToken == null) {
          print("Test 4");
          Navigator.of(context).pushNamed(
            '/otp',
            arguments: {
              "phone": phone,
              "email": email,
              "name": name,
              "vid": vid,
              "ftoken": i,
            },
          );
        }
      },
      autoTimeout: autoTimeOut ?? (val) {},
      onVerfied: onVerified ?? (val) {},
      register: register,
      onError: onError ?? () {},
    );
  }

  static void register(
    BuildContext context, {
    @required Function(bool) setLoading,
    @required GlobalKey<FormState> formKey,
    @required String phone,
    @required String name,
    @required String email,
    @required Function(int) setResetToken,
    @required Function onError,
    Function onVerified,
    Function(String) autoTimeOut,
    Function register,
    int forceResendToken,
  }) async {
    // if (formKey.currentState.validate()) {
    if (true) {
      setLoading(true);
      print("Register is :");
      print(register);
      try {
        Response response = await api.checkUser(email: email, phone: phone);
        print(response.data);

        if (!response.data["success"]) {
          setLoading(false);
          showError(context);
        } else if (response.data["exist"]) {
          setLoading(false);
          Utils.showWarning(
            context: context,
            content: "A User already exists with the provided details",
          );
        } else if (!response.data["exist"]) {
          print("Good To Go");
          verifyPhone(
            context,
            email: email,
            name: name,
            phone: phone,
            setLoading: setLoading,
            setResetToken: setResetToken,
            autoTimeOut: autoTimeOut,
            forceResendToken: forceResendToken,
            onVerified: onVerified,
            register: register,
            registration: true,
            onError: onError,
          );
        }
      } catch (e) {
        print(e);
        showError(context);
      }
    }
  }

  static void signIn(
    BuildContext context, {
    @required Function(bool) setLoading,
    @required GlobalKey<FormState> formKey,
    @required String phone,
    @required Function(int) setResetToken,
    @required Function onError,
    Function onVerified,
    Function(String) autoTimeOut,
    Function register,
    int forceResendToken,
  }) async {
    setLoading(true);
    var connectivity = await (Connectivity().checkConnectivity());
    if (connectivity == ConnectivityResult.none) {
      showWarning(
          context: context, content: "Please check your network connection");
    }
    if (formKey.currentState.validate()) {
      if (true) {
        print("Pressed SignIn");
        Response r = await api.checkPhoneExistence(phone);
        print(r);
        if (r == null) {
          showWarning(
            context: context,
            content: "An error occured please try again",
          );
          setLoading(false);
        } else if (!r.data["exist"]) {
          showWarning(
            context: context,
            content: "Phone number is not registered",
          );
          setLoading(false);
        } else {
          verifyPhone(
            context,
            phone: phone,
            registration: false,
            setLoading: setLoading,
            setResetToken: setResetToken,
            onError: onError,
            forceResendToken: forceResendToken,
            onVerified: () {},
            autoTimeOut: (val) {
              print(val);
            },
          );
        }
      }
    }
  }
}
