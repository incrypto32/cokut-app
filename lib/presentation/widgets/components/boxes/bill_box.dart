import 'package:cokut/cubit/cart/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BillBox extends StatelessWidget {
  const BillBox({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cartCubit = context.bloc<CartCubit>();
    var deliveryPrice = cartCubit.getDeliveryPrice();
    var cartTotal = cartCubit.getCartPrice();
    var grandTotal = deliveryPrice + cartTotal;
    return Container(
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
              children: [Text("Delivery Charge"), Text("$deliveryPrice")],
            ),
          ),
          Divider(
            color: Colors.black54,
            thickness: 1,
          ),
          DefaultTextStyle(
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Grand Total",
                  ),
                  Text("$grandTotal")
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
