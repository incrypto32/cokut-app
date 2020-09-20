import 'package:cokut/services/api.dart';
import 'package:cokut/services/auth.dart';
import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Utils {
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

  static checkConnectivity() async {
    try {
      var connectivity = await (Connectivity().checkConnectivity());
      if (connectivity == ConnectivityResult.none) {
        return false;
      }
    } catch (e) {
      print(e);
    }
    return true;
  }
}
