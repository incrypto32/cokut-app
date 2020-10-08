import 'package:cokut/models/meal.dart';
import 'package:cokut/models/restaurant.dart';
import 'package:flutter/material.dart';
import 'package:cokut/cubit/cart/cart_cubit.dart';
import 'package:cokut/infrastructure/repositories/cart_repo.dart';
import 'package:cokut/utils/logger.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class OrderTile extends StatelessWidget {
  final Restaurant _restaurant;
  const OrderTile(
    this._restaurant, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        logger.i("CART REBUILD");
        List<OrderMealTile> mealTiles = [];
        context.repository<CartRepository>().cart.forEach(
              (key, value) => mealTiles.add(
                OrderMealTile(
                  meal: value.meal,
                ),
              ),
            );
        return Card(
          elevation: 0,
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
            margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                OrderRestaurantTile(restaurant: _restaurant),
                SizedBox(height: 5),
                Text("₹ 101 ",
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.headline6),
                Divider(thickness: .4),
                ...mealTiles,
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          DateFormat("MMM  d,  hh:mm a ")
                              .format(DateTime.now()),
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                                fontSize: 13,
                                fontWeight: FontWeight.w100,
                                color: Colors.black38,
                              ),
                        ),
                      ),
                      Expanded(
                        child: Material(
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              padding: EdgeInsets.all(5),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Theme.of(context).accentColor,
                                ),
                              ),
                              child: Text(
                                "REORDER",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).accentColor,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ])
              ],
            ),
          ),
        );
      },
    );
  }
}

class OrderRestaurantTile extends StatelessWidget {
  const OrderRestaurantTile({
    Key key,
    @required Restaurant restaurant,
  })  : _restaurant = restaurant,
        super(key: key);

  final Restaurant _restaurant;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.of(context).pushNamed('/store', arguments: _restaurant);
        },
        child: Row(children: [
          Image.network(
            _restaurant.logo ??
                'https://is2-ssl.mzstatic.com/image/thumb/Purple62/v4/ea/6b/f6/ea6bf6ce-ee41-b67b-b1c8-245b5a0d9f7f/source/256x256bb.jpg',
            height: 50,
            width: 50,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 5),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(_restaurant.name ?? "Hotel Abcd",
                textAlign: TextAlign.left,
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(fontWeight: FontWeight.bold)),
            SizedBox(height: 2),
            Text(
              _restaurant.address,
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                  fontSize: 13,
                  fontWeight: FontWeight.w100,
                  color: Colors.black38),
            ),
          ]),
          Spacer(),
          Container(
              padding: EdgeInsets.all(10),
              child: 1 == 1
                  ? Row(children: [
                      Text(
                        "Delivered",
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                            fontSize: 13, fontWeight: FontWeight.w300),
                      ),
                      SizedBox(width: 2),
                      Icon(Icons.check_circle, color: Colors.green, size: 14)
                    ])
                  : Row(children: [
                      Text(
                        "On the way",
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                            fontSize: 13, fontWeight: FontWeight.w300),
                      ),
                      SizedBox(width: 2),
                      Icon(Icons.local_shipping, color: Colors.green, size: 14)
                    ]))
        ]));
  }
}

class OrderMealTile extends StatelessWidget {
  const OrderMealTile({
    Key key,
    this.meal,
  }) : super(key: key);

  final Meal meal;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 5),
        child: Row(
          children: [
            Text(meal.name, style: TextStyle(fontSize: 15)),
            Text("  x 2", style: TextStyle(fontSize: 15)),
          ],
        ));
  }
}
