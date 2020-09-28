import 'package:cokut/models/restaurant.dart';
import 'package:flutter/material.dart';

class RestaurantTile extends StatelessWidget {
  final Restaurant _restaurant;
  const RestaurantTile(
    this._restaurant, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: () {
            Navigator.of(context).pushNamed('/store', arguments: _restaurant);
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                _restaurant.logo ??
                    'https://is2-ssl.mzstatic.com/image/thumb/Purple62/v4/ea/6b/f6/ea6bf6ce-ee41-b67b-b1c8-245b5a0d9f7f/source/256x256bb.jpg',
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
              Expanded(
                flex: 4,
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _restaurant.name ?? "Hotel Abcd",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        "Hotel",
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        _restaurant.address,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 100,
                child: Center(
                  child: Icon(Icons.chevron_right),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
