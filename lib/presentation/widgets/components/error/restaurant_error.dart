import 'package:flutter/material.dart';

class RestaurantErrorWidget extends StatelessWidget {
  final Function reload;
  final String message;
  const RestaurantErrorWidget({
    Key key,
    this.reload,
    this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: Image.asset(
            'assets/images/error.png',
            height: 150,
          ),
        ),
        Text(
          message ?? "An error occured",
          style: TextStyle(color: Colors.red),
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
    );
  }
}
