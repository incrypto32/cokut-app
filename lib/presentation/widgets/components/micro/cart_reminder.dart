import 'package:cokut/cubit/cart/cart_cubit.dart';
import 'package:cokut/infrastructure/repositories/cart_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartReminder extends StatelessWidget {
  const CartReminder({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(builder: (context, state) {
      var repo = context.repository<CartRepository>();
      return repo.itemNumber() == 0
          ? Container()
          : InkWell(
              onTap: () => Navigator.of(context).pushNamed('/cart'),
              child: DefaultTextStyle(
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  height: 1.5,
                ),
                child: Container(
                  padding: EdgeInsets.all(10),
                  width: double.infinity,
                  color: Colors.green,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "${repo.itemNumber()} Items   |    ₹ ${repo.getCartPrice()} ",
                      ),
                      Spacer(),
                      Text("GO TO CART"),
                      SizedBox(width: 10),
                      Icon(
                        Icons.shopping_basket,
                        color: Colors.white,
                        size: 20,
                      )
                    ],
                  ),
                ),
              ),
            );
    });
  }
}
