import 'package:cokut/models/meal.dart';
import 'package:cokut/presentation/widgets/components/micro/cart_adder.dart';
import 'package:flutter/material.dart';

class MealTile extends StatelessWidget {
  const MealTile({
    Key key,
    this.meal,
  }) : super(key: key);

  final Meal meal;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      color: Colors.white,
      child: ListTile(
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
    );
  }
}
