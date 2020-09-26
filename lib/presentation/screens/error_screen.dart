import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  final Function reload;
  ErrorScreen(this.reload);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 100.0, vertical: 20),
            child: Image.asset(
              'assets/images/error.png',
            ),
          ),
          FlatButton(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Retry"),
                Icon(Icons.replay),
              ],
            ),
            onPressed: reload,
          ),
        ],
      ),
    );
  }
}
