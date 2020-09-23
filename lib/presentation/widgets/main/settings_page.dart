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
            onPressed: () {},
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
