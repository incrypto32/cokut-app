import 'package:cokut/models/user.dart';
import 'package:cokut/screens/homepage.dart';
import 'package:cokut/screens/reg_screen.dart';
import 'package:cokut/services/api.dart';
import 'package:cokut/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class RegDecider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<User>(
        future: api.getUser(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return HomePage();
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
              body: Center(
                child: SpinKitCircle(
                  size: 45,
                  color: Colors.black,
                ),
              ),
            );
          } else {
            return RegScreen();
          }
        });
  }
}
