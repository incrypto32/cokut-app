import 'package:cokut/cubit/cart/cart_cubit.dart';
import 'package:cokut/infrastructure/repositories/cart_repo.dart';
import 'package:cokut/infrastructure/repositories/restaurant_repo.dart';
import 'package:cokut/presentation/widgets/animation/fade.dart';
import 'package:cokut/presentation/widgets/components/boxes/address_box.dart';
import 'package:cokut/presentation/widgets/components/boxes/bill_box.dart';
import 'package:cokut/presentation/widgets/components/tiles/meal_tile.dart';
import 'package:cokut/presentation/widgets/components/tiles/restaurant_tile.dart';
import 'package:cokut/utils/logger.dart';
import 'package:cokut/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartWidget extends StatelessWidget {
  const CartWidget();
  @override
  Widget build(BuildContext context) {
    return FadeTransitionWidget(
      child: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          logger.i("CART REBUILD");
          List<MealTile> mealTiles = [];
          context.repository<CartRepository>().cart.forEach(
                (key, value) => mealTiles.add(
                  MealTile(
                    meal: value.meal,
                  ),
                ),
              );

          if (mealTiles.length == 0) {
            return Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 50),
                      child: Image.asset('assets/images/empty-cart.png'),
                    ),
                  ],
                ),
              ),
            );
          }

          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              centerTitle: true,
              backgroundColor: Colors.transparent,
              title: Container(
                padding: EdgeInsets.all(20),
                child: Text(
                  "Your Food Cart",
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
            ),
            body: Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                        margin: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(children: [
                              RestaurantTile(
                                context
                                        .repository<RestaurantRepository>()
                                        .restaurants[
                                    context.repository<CartRepository>().rid],
                              ),
                              ...mealTiles,
                              BillBox(),
                              AddressBox()
                            ]),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                      onPressed: () {
                        context.repository<CartRepository>().deliveryAddress ==
                                null
                            ? Utils.showWarning(context,
                                content: "Please select an address")
                            : Navigator.of(context).pushNamed('/checkout');
                      },
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
