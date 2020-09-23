import 'package:cokut/bloc_listener.dart/my_bloc_listener.dart';
import 'package:cokut/cubit/firebase_app/firebase_app_cubit.dart';
import 'package:cokut/data/auth_repo.dart';
import 'package:cokut/presentation/pages/auth_screen.dart';
import 'package:cokut/presentation/pages/home_screen.dart';
import 'package:cokut/presentation/pages/loading_screen.dart';
import 'package:cokut/presentation/pages/otp_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppView extends StatefulWidget {
  @override
  _AppViewState createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final _navigatorKey = GlobalKey<NavigatorState>();
  AuthenticationRepository authenticationRepository;
  NavigatorState get _navigator => _navigatorKey.currentState;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cokut',
      navigatorKey: _navigatorKey,
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/home': (ctx) => HomePage(),
        '/auth': (ctx) => AuthScreen(),
        '/otp': (ctx) => Otp(),
        '/loading': (ctx) => LoadingScreen(),
      },
      home: BlocBuilder<FirebaseAppCubit, FirebaseAppState>(
        builder: (context, state) {
          if (state is FirebaseAppLoaded) {
            return AuthBlocDecider(_navigator);
          } else {
            return LoadingScreen();
          }
        },
      ),
      onGenerateRoute: (ctx) => MaterialPageRoute(
        builder: (ctx) => LoadingScreen(),
      ),
    );
  }
}
