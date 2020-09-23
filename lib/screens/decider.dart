import 'package:cokut/screens/auth_screen.dart';
import 'package:cokut/screens/loading_screen.dart';
import 'package:cokut/screens/reg_decider.dart';
import 'package:cokut/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Decider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User>(
      stream: authService.authStream(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return LoadingScreen();
        }
        if (snapshot.hasData) {
          return RegDecider();
        }
        return AuthScreen();
      },
    );
    // return HomePage();
  }
}
