import 'package:cokut/services/api.dart';
import 'package:cokut/utils/utils.dart';
import 'package:cokut/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class RegisterForm extends StatefulWidget {
  RegisterForm({
    Key key,
  });

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  var _formKey = GlobalKey<FormState>();

  String name;

  String email;

  bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            Spacer(),
            Image.asset("assets/images/blaksid.png"),
            Text(
              "Complete your signup proccess",
              style: TextStyle(fontSize: 16),
            ),
            CustomTextFormField(
              borderRadius: 5,
              hintText: "Enter your name",
              onChanged: (val) {
                name = val;
              },
              validator: (String v) {
                if (v.length < 2) {
                  return "Enter a valid name";
                }
              },
            ),
            CustomTextFormField(
              borderRadius: 5,
              hintText: "Enter your email (optional)",
              onChanged: (val) {
                email = val;
              },
            ),
            RaisedButton(
              color: Colors.green,
              padding: EdgeInsets.all(0),
              child: Text(
                "Sign Up",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: register,
            ),
            Spacer(),
            Spacer(),
          ],
        ));
  }

  void register() async {
    //
    if (_formKey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });
      var resp = await api.registerUser(name: name, email: email, phone: null);
      if (resp == null) {
        Utils.showError(context);
      } else if (resp["success"]) {
        Navigator.of(context).pushReplacementNamed('/');
      } else if (resp["msg"] != null) {
        Utils.showWarning(context: context, content: resp["msg"]);
      }
    }
  }
}
