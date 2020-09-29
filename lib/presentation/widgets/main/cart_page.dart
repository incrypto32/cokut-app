import 'package:cokut/cubit/cart/cart_cubit.dart';
import 'package:cokut/presentation/widgets/components/meal_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartWidget extends StatelessWidget {
  const CartWidget();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        var cartCubit = context.bloc<CartCubit>();
        var deliveryPrice = cartCubit.getDeliveryPrice();
        var cartTotal = cartCubit.getCartPrice();
        var grandTotal = deliveryPrice + cartTotal;
        List<MealTile> mealTiles = [];
        state.cartItems.forEach(
          (key, value) => mealTiles.add(
            MealTile(
              meal: value.meal,
            ),
          ),
        );
        if (mealTiles.length == 0) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 50),
                  child: Image.asset('assets/images/empty-cart.png'),
                ),
              ],
            ),
          );
        }
        return SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      "Your Food Cart",
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ),
                  ...mealTiles,
                  Container(
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.symmetric(
                      vertical: 20,
                    ),
                    color: Colors.white,
                    width: double.infinity,
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Cart Total"),
                              Text(cartCubit.getCartPrice().toString() ?? "")
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Delivery Charge"),
                              Text("$deliveryPrice")
                            ],
                          ),
                        ),
                        Divider(
                          color: Colors.black54,
                          thickness: 1,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Grand Total"),
                              Text("$grandTotal")
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
                Container(
                  margin: EdgeInsets.all(30),
                  height: 40.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.green,
                  ),
                  child: RaisedButton(
                    color: Colors.green,
                    child: Text(
                      "PLACE ORDER",
                      style: TextStyle(fontSize: 18.0, color: Colors.white),
                    ),
                    onPressed: () {},
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class Bill extends StatelessWidget {
  const Bill({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.white,
          child: ListTile(
            title: Text("Items Total"),
            trailing: Text(""),
          ),
        ),
        Container(
          color: Colors.white,
          child: ListTile(
            title: Text("Delivery Fee"),
            trailing: Text(""),
          ),
        ),
        Container(
          // padding: EdgeInsets.symmetric(horizontal: 5.0),
          decoration: BoxDecoration(
              border: Border(
                top: BorderSide(width: 1.0, color: Colors.black),
              ),
              color: Colors.white),
          //color: Colors.white,
          child: ListTile(
            title: Center(
              child: Text("Total"),
            ),
            trailing: Text(""),
          ),
        )
      ],
    );
  }
}
