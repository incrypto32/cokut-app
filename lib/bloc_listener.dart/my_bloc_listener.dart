import 'package:cokut/cubit/authentication/authentication_cubit.dart';
import 'package:cokut/presentation/screens/auth_screen.dart';
import 'package:cokut/presentation/screens/loading_screen.dart';
import 'package:cokut/presentation/switchers/home_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBlocDecider extends StatefulWidget {
  final dynamic navigator;
  const AuthBlocDecider(this.navigator);

  @override
  _AuthBlocDeciderState createState() => _AuthBlocDeciderState();
}

class _AuthBlocDeciderState extends State<AuthBlocDecider> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationCubit, AuthenticationState>(
      builder: (context, state) {
        print(state);
        if (state is AuthenticationLoading) {
          return LoadingScreen();
        } else if (state is Authenticated) {
          return HomeSwitcher();
        }
        return AuthScreen();
      },
    );
  }
}
