import 'package:cokut/services/api.dart';
import 'package:cokut/widgets/custom_text_form_field.dart';
import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';

class SignInForm extends StatefulWidget {
  SignInForm({Key key, this.toggle}) : super(key: key);
  final Function toggle;

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String phone;
  @override
  Widget build(BuildContext context) {
    print("Builded");
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
            },
          ),
          RaisedButton(
            onPressed: () async {
              Function({String content}) showWarning = ({String content}) {
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      content ?? "Please Check Your Internet Connectivity",
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              };

              // showWarning();
              var connectivity = await (Connectivity().checkConnectivity());
              if (connectivity == ConnectivityResult.none) {
                showWarning();
              }
              // if (_formKey.currentState.validate()) {
              if (true) {
                print("pressed signin");
                Response r =
                    await api.checkPhoneExistence(phone ?? "7034320441");
                print(r);
                if (r == null) {
                  showWarning(content: "An error occured please try again");
                }
                if (!r.data["exist"]) {
                  showWarning(content: "Phone number is not registered");
                }
              }
            },
            color: Colors.green,
            padding: EdgeInsets.symmetric(horizontal: 30),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            textColor: Colors.white,
            child: Text("Sign In"),
          ),
          Spacer(),
          FlatButton(
            onPressed: widget.toggle,
            child: Text("Don't have an account ? Sign Up"),
          ),
          SignInButton(Buttons.Google, onPressed: () {
            _formKey.currentState.validate();
          }),
          Spacer(),
        ],
      ),
    );
  }
}
