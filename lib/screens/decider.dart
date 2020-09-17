import 'package:cokut/screens/auth_screen.dart';
import 'package:cokut/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Decider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User>(
      stream: authService.authStream(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            body: Container(
              color: Colors.white,
              child: Center(
                child: Text("Logged In"),
              ),
            ),
          );
        }
        return AuthScreen();
      },
    );
  }
}
