import 'package:cokut/models/user.dart';
import 'package:cokut/screens/homepage.dart';
import 'package:cokut/screens/loading_screen.dart';
import 'package:cokut/screens/reg_screen.dart';
import 'package:cokut/services/api.dart';
import 'package:flutter/material.dart';

class RegDecider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<User>(
      future: api.getUser(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          print(snapshot.data.email);
          if (!snapshot.data.registered) {
            return RegScreen();
          } else {
            return HomePage();
          }
        } else if (snapshot.hasError) {
          print(snapshot.error);
          return Text("ERROR");
        }
        return LoadingScreen();
      },
    );
  }
}
