import 'package:cokut/widgets/registration_form.dart';
import 'package:cokut/widgets/sign_in_form.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool _isSignIn = true;
  int duration = 100;
  void _toggle() {
    setState(() {
      print("hello");
      _isSignIn = !_isSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: _isSignIn ? Colors.black : Colors.white,
      body: SingleChildScrollView(
        child: Container(
          height: mediaQuery.size.height,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                flex: 2,
                child: AnimatedContainer(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: _isSignIn
                          ? BorderRadius.circular(0)
                          : BorderRadius.vertical(
                              bottom: Radius.circular(60),
                            )),
                  duration: Duration(milliseconds: duration),
                  child: Column(
                    children: [
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 70),
                        child: Image.asset(
                          'assets/images/whitesid.png',
                        ),
                      ),
                      Text(
                        "feel the luxury of food",
                        style: TextStyle(color: Colors.white),
                      ),
                      Spacer()
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 6,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: duration),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: _isSignIn
                        ? BorderRadius.vertical(
                            top: Radius.circular(60),
                          )
                        : BorderRadius.circular(0),
                  ),
                  child: _isSignIn
                      ? SignInForm(toggle: _toggle)
                      : RegistrationForm(toggle: _toggle),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
