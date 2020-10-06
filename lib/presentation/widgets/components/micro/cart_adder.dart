import 'package:cokut/models/meal.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cokut/cubit/cart/cart_cubit.dart';
import 'package:flutter/material.dart';

class IncrementWidget extends StatelessWidget {
  final Meal meal;
  IncrementWidget({this.meal});

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, StateSetter setState) {
        void increment() {
          context.bloc<CartCubit>().addToCart(context, meal);
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
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6.0),
                alignment: Alignment.center,
                width: 30,
                child: BlocBuilder<CartCubit, CartState>(
                  builder: (context, state) {
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
