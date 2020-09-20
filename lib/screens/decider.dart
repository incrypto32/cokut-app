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
          snapshot.data.getIdToken().then((value) {
            print(value);
          });
          return Scaffold(
            body: Container(
              color: Colors.white,
              child: Center(
                child: FlatButton(
                    onPressed: () {
                      authService.signOut();
                    },
                    child: Text("Log Out")),
              ),
            ),
          );
        }
        return AuthScreen();
      },
    );
  }
}
