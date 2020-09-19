import 'package:cokut/screens/homepage.dart';
import 'package:cokut/screens/init_screen.dart';
import 'package:cokut/screens/otp_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cokut',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

      routes: {
        '/home': (ctx) => HomePage(),
        '/otp': (ctx) => Otp(),
      },
      home: InitScreen(),
      // home: HomePage(),
    );
  }
}
