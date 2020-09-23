import 'package:cokut/services/auth.dart';
import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          FlatButton(
            onPressed: () {
              authService.signOut();
            },
            child: Text(
              "Log Out",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
