import 'package:cokut/cubit/authentication/authentication_cubit.dart';
import 'package:cokut/presentation/pages/loading_screen.dart';
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
    return BlocListener<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) async {
        await Future.delayed(Duration(seconds: 2));
        print(state);
        if (state is AuthenticationLoading) {
          widget.navigator.pushNamedAndRemoveUntil(
            '/loading',
            (route) => false,
          );
        } else if (state is Authenticated) {
          widget.navigator.pushNamedAndRemoveUntil(
            '/home',
            (route) => false,
          );
        } else {
          widget.navigator.pushNamedAndRemoveUntil(
            '/auth',
            (route) => false,
          );
        }
      },
      child: LoadingScreen(),
    );
  }
}
