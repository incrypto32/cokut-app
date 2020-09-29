import 'package:cokut/cubit/cart/cart_cubit.dart';
import 'package:cokut/models/meal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
              "₹${meal.displayPrize}",
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

class IncrementWidget extends StatelessWidget {
  final Meal meal;
  IncrementWidget({this.meal});

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, StateSetter setState) {
        void increment() {
          context.bloc<CartCubit>().addToCart(meal);
        }

        void decrement() {
          context.bloc<CartCubit>().removFromCart(meal);
        }

        return Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.green,
            ),
          ),
          //row for choosing count
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(
                  Icons.remove,
                  color: Colors.green,
                ),
                onPressed: decrement,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6.0),
                child: BlocBuilder<CartCubit, CartState>(
                  builder: (context, state) {
                    print(state);

                    return Text(
                      (state.cartItems[meal.id] != null
                          ? state.cartItems[meal.id].count.toString()
                          : "0"),
                    );
                  },
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.add,
                  color: Colors.green,
                ),
                onPressed: increment,
              ),
            ],
          ),
        );
      },
    );
  }
}
