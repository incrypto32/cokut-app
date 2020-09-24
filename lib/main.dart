import 'package:cokut/cubit/firebase_app/firebase_app_cubit.dart';
import 'package:cokut/infrastructure/repositories/auth_repo.dart';
import 'package:cokut/presentation/core/app_view.dart';
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
      child: RepositoryProvider(
        create: (context) => AuthenticationRepository(),
        child: AppView(),
      ),
    );
  }
}
