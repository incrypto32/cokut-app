import 'package:cokut/cubit/firebase_app_cubit.dart';
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
      child: AppView(),
    );
  }
}
