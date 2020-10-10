import 'package:cokut/cubit/user_data/user_data_cubit.dart';
import 'package:cokut/infrastructure/repositories/auth_repo.dart';
import 'package:cokut/presentation/widgets/components/micro/custom_text_form_field.dart';
import 'package:cokut/utils/logger.dart';
import 'package:cokut/utils/validators.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class RegistrationForm extends StatefulWidget {
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Map<String, String> data = {};

  @override
  Widget build(BuildContext context) {
    var user = context.repository<AuthenticationRepository>().getUser();

    logger.d("${user.phoneNumber}  ${user.email}");
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(8),
            child: Text(
              "Register",
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          CustomTextFormField(
            borderRadius: 0,
            hintText: "Name",
            onChanged: (val) {
              data["name"] = val;
            },
            validator: Validate.name,
          ),
          user.email == null
              ? CustomTextFormField(
                  borderRadius: 0,
                  hintText: "Email",
                  textInputType: TextInputType.emailAddress,
                  onChanged: (val) {
                    data["email"] = val;
                  },
                  validator: Validate.email,
                )
              : Container(),
          user.phoneNumber == null
              ? CustomTextFormField(
                  borderRadius: 0,
                  hintText: "Phone",
                  textInputType: TextInputType.phone,
                  onChanged: (val) {
                    data["phone"] = "+91" + val;
                  },
                  validator: Validate.phone,
                )
              : Container(),
          FlatButton(
            textColor: Colors.white,
            color: Colors.green,
            onPressed: () {
              if (_formKey.currentState.validate()) {
                context.bloc<UserDataCubit>().registerUser(
                      email: data["email"] ?? user.email,
                      name: data["name"] ?? user.phoneNumber,
                      phoneNumber: data["phone"],
                    );
              }
            },
            child: Text("Register"),
          )
        ],
      ),
    );
  }
}
