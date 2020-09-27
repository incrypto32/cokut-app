import 'package:cokut/models/restaurant.dart';
import 'package:flutter/material.dart';

class StoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Restaurant restaurant =
        ModalRoute.of(context).settings.arguments ?? Restaurant();

    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 150,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/restcover.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: DefaultTextStyle(
              style: TextStyle(color: Colors.white),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    restaurant.name ?? "<Restaurant Name>",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline4.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(color: Colors.black, blurRadius: 10),
                      ],
                    ),
                  ),
                  Text(
                    restaurant.address ?? "<Address>",
                  )
                ],
              ),
            ),
          ),
          Expanded(
              child: Container(
            color: Colors.white,
          )),
        ],
      ),
    );
  }
}
