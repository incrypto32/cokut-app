import 'package:cokut/widgets/register_form.dart';
import 'package:flutter/material.dart';

class RegScreen extends StatefulWidget {
  @override
  _RegScreenState createState() => _RegScreenState();
}

class _RegScreenState extends State<RegScreen> {
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Enter profile details"),
        centerTitle: true,
      ),
      body: RegisterForm(),
    );
  }
}
