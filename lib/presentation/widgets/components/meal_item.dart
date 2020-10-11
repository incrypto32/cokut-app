import 'package:cokut/models/meal.dart';
import 'package:cokut/models/restaurant.dart';
import 'package:cokut/presentation/widgets/components/micro/cart_adder.dart';
import 'package:flutter/material.dart';

class MealTile extends StatelessWidget {
  const MealTile({
    Key key,
    this.meal,
    this.restaurant,
    this.isSearch = false,
  }) : super(key: key);

  final Meal meal;
  final Restaurant restaurant;
  final bool isSearch;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      margin: EdgeInsets.symmetric(vertical: 3),
      color: Colors.white,
      child: Column(
        children: [
          if (isSearch)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(children: [
                Image.network(
                  restaurant?.logo ??
                      'https://is2-ssl.mzstatic.com/image/thumb/Purple62/v4/ea/6b/f6/ea6bf6ce-ee41-b67b-b1c8-245b5a0d9f7f/source/256x256bb.jpg',
                  height: 50,
                  width: 50,
                  fit: BoxFit.cover,
                ),
                SizedBox(width: 5),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(restaurant?.name ?? "Hotel Abcd",
                      textAlign: TextAlign.left,
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(fontWeight: FontWeight.bold)),
                  SizedBox(height: 2),
                  Text(
                    restaurant?.address ?? "Thrissur",
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                        fontSize: 13,
                        fontWeight: FontWeight.w100,
                        color: Colors.black38),
                  ),
                ]),
              ]),
            ),
          ListTile(
            title: Text(
              meal.name,
              style: TextStyle(fontSize: 15),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "",
                  style: TextStyle(fontSize: 12),
                ),
                Text(
                  "₹${meal.displayPrice}",
                  style: TextStyle(fontSize: 12),
                )
              ],
            ),
            trailing: IncrementWidget(
              meal: meal,
            ),
          ),
        ],
      ),
    );
  }
}
