import 'package:cokut/cubit/login_form/login_cubit.dart';
import 'package:cokut/utils/utils.dart';
import 'package:cokut/presentation/widgets/components/custom_text_form_field.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  bool isLoading = false;

  void setLoading(bool val) {
    print("Setting loading  $val");
    setState(() {
      isLoading = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        setLoading(false);
        if (state is LoginLoading) {
          setLoading(true);
        } else if (state is LoginPhoneOTPSend) {
          Navigator.of(context).pushNamed('/otp');
        } else if (state is LoginOtpAutoRetrievalTimeOut) {
          print("State is TIMEOUT ${state.codeSent}");
          state.codeSent
              ? Utils.showWarning(context,
                  content: "Please check your network connection")
              : debugPrint("Do Nothing");
        }
      },
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: Column(
            children: [
              Spacer(),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(20),
                child: Text(
                  "Sign In",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                  ),
                ),
              ),
              CustomTextFormField(
                hintText: "Phone",
                // prefixText: "+91 ",
                borderRadius: 10,
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
                onPressed: signInWithPhone,
                color: Colors.green,
                padding: EdgeInsets.symmetric(horizontal: 30),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                textColor: Colors.white,
                child: isLoading
                    ? Container(
                        width: 20,
                        child: SpinKitRing(
                          color: Colors.white,
                          lineWidth: 5,
                          size: 20,
                        ),
                      )
                    : Text("Sign In"),
              ),
              Spacer(),
              SignInButton(Buttons.Google, onPressed: signInWithGoogle),
              Spacer(),
            ],
          ),
        );
      },
    );
  }

  void signInWithPhone() async {
    var connectivity = await Utils.checkConnectivity();
    !connectivity
        ? Utils.showWarning(
            context,
            content: "Please check your network connection",
          )
        : print("Connection good");

    if (connectivity && _formKey.currentState.validate()) {
      context.bloc<LoginCubit>().verifyPhone(phone);
    }
  }

  void signInWithGoogle() {
    // logger.d("HI");
    // logger.e("AYYO");
    // logger.w("SHIT");
    // logger.wtf("AYYYYYOOO");
    // logger.i("HMM");
    context.bloc<LoginCubit>().signInWithGoogle();
  }
}
