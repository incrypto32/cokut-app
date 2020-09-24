import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Utils {
  static showWarning(
    BuildContext context, {
    @required String content,
  }) {
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
      context,
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
