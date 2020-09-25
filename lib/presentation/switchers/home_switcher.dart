import 'package:cokut/cubit/user_data/user_data_cubit.dart';
import 'package:cokut/presentation/screens/home_screen.dart';
import 'package:cokut/presentation/screens/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeSwitcher extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserDataCubit, UserDataState>(
      builder: (context, state) {
        if (state is UserDataLoading) {
          LoadingScreen();
        } else if (state is UserRegistered) {
          HomeScreen();
        } else if (state is UserNotRegistered) {
          return Scaffold(
            body: Center(
              child: Text("Not Registered"),
            ),
          );
        }
        return LoadingScreen();
      },
    );
  }
}
