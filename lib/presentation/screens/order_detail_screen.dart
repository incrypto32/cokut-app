import 'package:cokut/cubit/cart/cart_cubit.dart';
import 'package:cokut/infrastructure/repositories/cart_repo.dart';
import 'package:cokut/infrastructure/repositories/restaurant_repo.dart';
import 'package:cokut/presentation/widgets/components/boxes/address_box.dart';
import 'package:cokut/presentation/widgets/components/boxes/bill_box.dart';
import 'package:cokut/presentation/widgets/components/meal_item.dart';
import 'package:cokut/presentation/widgets/components/restaurant_tile.dart';
import 'package:cokut/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrdersDetailScreen extends StatelessWidget {
  const OrdersDetailScreen();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
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

        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            iconTheme: IconTheme.of(context).copyWith(color: Colors.black),
            backgroundColor: Colors.white,
            title: Text(
              "Orders",
              style: TextStyle(color: Colors.black),
            ),
          ),
          body: (mealTiles.length == 0)
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("No orders")
                      // Container(
                      //   margin: EdgeInsets.symmetric(horizontal: 50),
                      //   child: Image.asset('assets/images/empty-cart.png'),
                      // ),
                    ],
                  ),
                )
              : Container(
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
                                        context
                                            .repository<CartRepository>()
                                            .rid],
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
                     
                    ],
                  ),
                ),
        );
      },
    );
  }
}
