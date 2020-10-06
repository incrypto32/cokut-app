import 'package:connectivity/connectivity.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Utils {
  static showWarning(
    BuildContext context, {
    @required String content,
  }) {
    showFlushBar(context, content, icon: Icon(Icons.warning));
  }

  showCartMessage(
    BuildContext context, {
    @required String content,
  }) {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 1),
        elevation: 0,
        backgroundColor: Colors.transparent,
        content: Card(
          elevation: 5,
          color: Colors.white,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            alignment: Alignment.center,
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  content,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black54),
                ),
                Icon(
                  Icons.shopping_basket,
                  color: Colors.green,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static showFlushBar(context, content, {Icon icon}) {
    Flushbar(
      animationDuration: Duration(milliseconds: 400),
      duration: Duration(seconds: 2),
      isDismissible: false,
      backgroundColor: Colors.transparent,
      borderRadius: 10,
      flushbarStyle: FlushbarStyle.GROUNDED,
      messageText: Card(
        elevation: 5,
        color: Colors.black54,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          alignment: Alignment.center,
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                content,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
              icon ??
                  Icon(
                    Icons.shopping_basket,
                    color: Colors.green,
                  ),
            ],
          ),
        ),
      ),
    )..show(context);
  }

  showError(BuildContext context) {
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
