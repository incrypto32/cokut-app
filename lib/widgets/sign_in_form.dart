import 'package:cokut/services/auth.dart';
import 'package:cokut/utils/utils.dart';
import 'package:cokut/widgets/custom_text_form_field.dart';

import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SignInForm extends StatefulWidget {
  SignInForm({Key key}) : super(key: key);

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String phone;
  int forceResentToken;
  bool isLoading = false;

  void setLoading(bool val) {
    print("Setting loading  $val");
    setState(() {
      isLoading = val;
    });
  }

  void setResetToken(int val) {
    print("Setting reset toke $val");
    forceResentToken = val;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(30),
            child: Text(
              "Sign In",
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey,
              ),
            ),
          ),
          Image.asset(
            'assets/images/login.png',
            width: 100,
          ),
          CustomTextFormField(
            hintText: "Phone",
            prefixText: "+91 ",
            validator: (val) {
              if (val == null) {
                return null;
              }
              if (val != null && val.length != 10) {
                return "Enter a valid phone number";
              }
              return null;
            },
            onChanged: (val) {
              phone = val;
              print(val);
            },
          ),
          RaisedButton(
            onPressed: signIn,
            color: Colors.green,
            padding: EdgeInsets.symmetric(horizontal: 30),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            textColor: Colors.white,
            child: Text("Sign In"),
          ),
          isLoading
              ? SpinKitRing(
                  color: Colors.blue,
                  size: 25,
                  lineWidth: 5,
                )
              : Container(),
          Spacer(),
          SignInButton(Buttons.Google, onPressed: () {
            Navigator.of(context).pushNamed('/otp');
          }),
          Spacer(),
        ],
      ),
    );
  }

  void verifyPhone() {
    authService.verifyPhone(
        phoneNo: phone,
        verificationFailed: (error) {
          print(error);
          Utils.showError(context);
          setState(() {
            isLoading = false;
          });
        },
        forceResendToken: forceResentToken,
        onError: () {},
        codeSent: (vid, i) {
          setState(() {
            forceResentToken = i;
          });
          print("Code Sent");
          setState(() {
            isLoading = false;
          });
          if (forceResentToken != null) {
            Navigator.of(context).pushNamed('/otp', arguments: {
              "phone": phone,
              "vid": vid,
            });
          }
        },
        autoTimeout: (s) {
          print("Time Out");
        },
        onVerfied: () {
          print("Verified");
        });
  }

  void signIn() async {
    setState(() {
      isLoading = true;
    });
    var connectivity = await Utils.checkConnectivity();
    !connectivity
        ? Utils.showWarning(
            context: context, content: "Please check your network connection")
        : print("Connection good");

    if (connectivity && _formKey.currentState.validate()) {
      verifyPhone();
    }
  }
}
