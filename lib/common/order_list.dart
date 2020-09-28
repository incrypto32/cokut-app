import 'package:flutter/material.dart';
import 'package:cokut/models/cartItem.dart';

class CartItemsList extends StatelessWidget {
  const CartItemsList({
    Key key,
    @required this.hpad,
    @required this.items,
    @required this.ordFont,
  }) : super(key: key);

  final double hpad;
  final List<CartItem> items;
  final double ordFont;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 175.00,
      padding: EdgeInsets.symmetric(horizontal: hpad),
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.all(5.0),
            color: Colors.white,
            child: ListTile(
              title: Text(
                items[index].name,
                style: TextStyle(fontSize: ordFont),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    items[index].hotel,
                    style: TextStyle(fontSize: ordFont - 5.0),
                  ),
                  Text(
                    "${items[index].price},",
                    style: TextStyle(fontSize: ordFont - 2.0),
                  )
                ],
              ),
              trailing: Container(
                width: 75.0,
                decoration:
                BoxDecoration(border: Border.all(color: Colors.black)),

                //row for choosing count
                child: Row(
                  children: [
                    GestureDetector(
                      child: Icon(
                        Icons.add,
                      ),
                      onTap: () {
                        print("${items[index].count} add");
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text("${items[index].count}"),
                    ),
                    GestureDetector(
                        child: Icon(
                          Icons.remove,
                        ),
                        onTap: () {
                          print("${items[index].count} minus");
                        }),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }}