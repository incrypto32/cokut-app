import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cokut/cubit/authentication/authentication_cubit.dart';
import 'package:cokut/presentation/screens/auth_screen.dart';
import 'package:cokut/presentation/screens/loading_screen.dart';
import 'package:cokut/cubit/user_data/user_data_cubit.dart';
import 'package:cokut/infrastructure/repositories/auth_repo.dart';
import 'package:cokut/infrastructure/repositories/user_repo.dart';
import 'package:cokut/presentation/switchers/home_switcher.dart';

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
          return BlocProvider<UserDataCubit>(
            create: (ctx) => UserDataCubit(
              context.repository<UserRepository>(),
              context.repository<AuthenticationRepository>(),
            ),
            child: HomeSwitcher(),
          );
        }
        return AuthScreen();
      },
    );
  }
}
