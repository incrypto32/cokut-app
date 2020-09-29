import 'package:cokut/cubit/firebase_app/firebase_app_cubit.dart';
import 'package:cokut/infrastructure/repositories/auth_repo.dart';
import 'package:cokut/infrastructure/repositories/cart_repo.dart';
import 'package:cokut/infrastructure/repositories/meals_repo.dart';
import 'package:cokut/infrastructure/repositories/restaurant_repo.dart';
import 'package:cokut/infrastructure/repositories/user_repo.dart';
import 'package:cokut/presentation/switchers/app_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (ctx) => FirebaseAppCubit(),
      child: MultiRepositoryProvider(
        providers: [
          RepositoryProvider(create: (context) => AuthenticationRepository()),
          RepositoryProvider(create: (context) => UserRepository()),
          RepositoryProvider(create: (context) => RestaurantRepository()),
          RepositoryProvider(create: (context) => MealsRepository()),
          RepositoryProvider(create: (context) => CartRepositoryMock123()),
        ],
        child: AppView(),
      ),
    );
  }
}
