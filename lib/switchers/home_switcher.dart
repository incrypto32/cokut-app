import 'package:cokut/cubit/user_data/user_data_cubit.dart';
import 'package:cokut/infrastructure/repositories/auth_repo.dart';
import 'package:cokut/presentation/screens/home_screen.dart';
import 'package:cokut/presentation/screens/utils/error_screen.dart';
import 'package:cokut/presentation/screens/utils/loading_screen.dart';
import 'package:cokut/presentation/screens/auth/registration_screen.dart';
import 'package:cokut/utils/logger.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeSwitcher extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // context.bloc<UserDataCubit>().getUser();
    return BlocBuilder<UserDataCubit, UserDataState>(
      buildWhen: (previous, current) {
        logger.i(current);
        return !(current is UserRegisterLoading ||
            current is UserRegistrationError ||
            current is AddressDataState);
      },
      builder: (context, state) {
        print("State is $state");
        if (state is UserDataLoading) {
          return LoadingScreen();
        } else if (state is UserRegistered) {
          return HomeScreen();
        } else if (state is UserNotRegistered) {
          return RegistrationScreen();
        } else if (state is UserDataError) {
          return WillPopScope(
            onWillPop: () async {
              context.repository<AuthenticationRepository>().logOut();
              return false;
            },
            child: ErrorScreen(
              () {
                context.bloc<UserDataCubit>().getUser();
              },
            ),
          );
        }
        return LoadingScreen();
      },
    );
  }
}
