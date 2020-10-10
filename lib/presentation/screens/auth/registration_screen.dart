import 'package:cokut/cubit/user_data/user_data_cubit.dart';
import 'package:cokut/infrastructure/repositories/auth_repo.dart';
import 'package:cokut/presentation/widgets/forms/registration_form.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class RegistrationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.repository<AuthenticationRepository>().logOut();
        return false;
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Spacer(),
                Container(
                  margin: EdgeInsets.all(50),
                  child: Image.asset(
                    'assets/images/blaksid.png',
                  ),
                ),
                Container(
                  height: 100,
                  child: BlocBuilder<UserDataCubit, UserDataState>(
                    builder: (context, state) {
                      if (state is UserRegisterLoading) {
                        return SpinKitCircle(
                          size: 50,
                          color: Colors.green,
                        );
                      } else if (state is UserRegistrationError) {
                        return Container(
                          width: 300,
                          child: Text(
                            state.message ?? "An error occured",
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2
                                .copyWith(color: Colors.red),
                          ),
                        );
                      }
                      return Container();
                    },
                  ),
                ),
                Spacer(),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(30),
                    ),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10,
                        spreadRadius: 2,
                        color: Colors.grey,
                      )
                    ],
                  ),
                  child: RegistrationForm(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
