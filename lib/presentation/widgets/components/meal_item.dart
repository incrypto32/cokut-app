import 'package:flutter/material.dart';

class MealTile extends StatelessWidget {
  const MealTile({
    Key key,
    @required this.name,
    @required this.hotel,
    @required this.price,
    @required this.count,
  }) : super(key: key);

  final String name;
  final String hotel;
  final double price;
  final int count;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        name,
        style: TextStyle(fontSize: 15),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            hotel,
            style: TextStyle(fontSize: 12),
          ),
          Text(
            "${price}",
            style: TextStyle(fontSize: 12),
          )
        ],
      ),
      trailing: IncrementWidget(),
    );
  }
}

class IncrementWidget extends StatelessWidget {
  IncrementWidget();
  static int _count = 0;
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, StateSetter setState) {
        void increment() {
          setState(() {
            _count++;
          });
        }

        void decrement() {
          setState(() {
            _count > 0 ? _count-- : 0;
          });
        }

        return Container(
          width: 75.0,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
          ),
          //row for choosing count
          child: Row(
            children: [
              GestureDetector(
                child: Icon(
                  Icons.add,
                ),
                onTap: () {
                  print("${_count} add");
                  increment();
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6.0),
                child: Text("${_count}"),
              ),
              GestureDetector(
                child: Icon(
                  Icons.remove,
                ),
                onTap: () {
                  print("${_count} minus");
                  decrement();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
