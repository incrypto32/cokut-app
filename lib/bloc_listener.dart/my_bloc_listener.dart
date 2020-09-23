import 'package:cokut/cubit/authentication_cubit.dart';
import 'package:cokut/data/auth_repo.dart';
import 'package:cokut/presentation/pages/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBlocDecider extends StatelessWidget {
  final dynamic navigator;
  const AuthBlocDecider(this.navigator);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (ctx) => AuthenticationCubit(AuthenticationRepository()),
      child: BlocListener<AuthenticationCubit, AuthenticationState>(
        listener: (context, state) async {
          await Future.delayed(Duration(seconds: 2));
          print(state);
          if (state is AuthenticationLoading) {
            navigator.pushNamedAndRemoveUntil(
              '/loading',
              (route) => false,
            );
          } else if (state is Authenticated) {
            navigator.pushNamedAndRemoveUntil(
              '/home',
              (route) => false,
            );
          } else {
            navigator.pushNamedAndRemoveUntil(
              '/auth',
              (route) => false,
            );
          }
        },
        child: LoadingScreen(),
      ),
    );
  }
}
