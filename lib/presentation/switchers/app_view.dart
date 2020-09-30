import 'package:cokut/cubit/cart/cart_cubit.dart';
import 'package:cokut/infrastructure/repositories/cart_repo.dart';
import 'package:cokut/models/meal.dart';
import 'package:cokut/presentation/screens/meal_cat_screen.dart';
import 'package:cokut/presentation/screens/restaurants_list_screen.dart';
import 'package:cokut/presentation/screens/store_screen.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cokut/bloc_listener/my_bloc_listener.dart';
import 'package:cokut/cubit/authentication/authentication_cubit.dart';
import 'package:cokut/cubit/firebase_app/firebase_app_cubit.dart';
import 'package:cokut/cubit/login_form/login_cubit.dart';
import 'package:cokut/infrastructure/repositories/auth_repo.dart';
import 'package:cokut/presentation/screens/auth_screen.dart';
import 'package:cokut/presentation/screens/home_screen.dart';
import 'package:cokut/presentation/screens/loading_screen.dart';
import 'package:cokut/presentation/screens/otp_screen.dart';

class AppView extends StatefulWidget {
  @override
  _AppViewState createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final _navigatorKey = GlobalKey<NavigatorState>();
  NavigatorState get _navigator => _navigatorKey.currentState;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationCubit>(
          create: (ctx) => AuthenticationCubit(
            context.repository<AuthenticationRepository>(),
          ),
        ),
        BlocProvider<LoginCubit>(
          create: (ctx) => LoginCubit(
            context.repository<AuthenticationRepository>(),
          ),
        ),
        BlocProvider<CartCubit>(
          create: (ctx) => CartCubit(
            context.repository<CartRepositoryMock123>(),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Cokut',
        navigatorKey: _navigatorKey,
        theme: ThemeData(
          primarySwatch: Colors.green,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: {
          '/home': (ctx) => HomeScreen(),
          '/auth': (ctx) => AuthScreen(),
          '/otp': (ctx) => Otp(),
          '/loading': (ctx) => LoadingScreen(),
          '/restaurants': (ctx) => RestaurantListScreen(),
          '/homemade': (ctx) => RestaurantListScreen(isHomeMade: true),
          '/store': (ctx) => RestaurantScreen(),
          '/specials': (ctx) => MealCategoryScreen(mealType: MealType.special),
          '/spicey': (ctx) => MealCategoryScreen(mealType: MealType.spicey),
        },
        home: BlocBuilder<FirebaseAppCubit, FirebaseAppState>(
          builder: (context, state) {
            print(state);
            if (state is FirebaseAppLoaded) {
              return AuthBlocDecider(_navigator);
            } else {
              return LoadingScreen();
            }
          },
        ),
      ),
    );
  }
}
