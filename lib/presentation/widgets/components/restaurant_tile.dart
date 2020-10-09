import 'package:cokut/models/restaurant.dart';
import 'package:cokut/provider/favorites.dart';
import 'package:cokut/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RestaurantTile extends StatelessWidget {
  final Restaurant _restaurant;
  const RestaurantTile(
    this._restaurant, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColorFiltered(
      colorFilter: ColorFilter.mode(
        _restaurant.closed ? Colors.white : Colors.transparent,
        BlendMode.saturation,
      ),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        child: Material(
          color: Colors.white,
          child: InkWell(
            onTap: () {
              _restaurant.closed
                  ? Utils.showFlushBar(context,
                      "The restaurant is closed for now come back later",
                      icon: Icon(
                        Icons.store_mall_directory,
                        color: Colors.red,
                      ))
                  : Navigator.of(context).pushNamed(
                      '/store',
                      arguments: _restaurant,
                    );
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _restaurant.logo == null
                    ? Image.network(
                        _restaurant.logo,
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      )
                    : Icon(Icons.store_mall_directory),
                Expanded(
                  flex: 4,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _restaurant.name ?? "Hotel Abcd",
                          textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        SizedBox(height: 2),
                        Text(
                          "Hotel",
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        SizedBox(height: 2),
                        Text(
                          _restaurant.address,
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                              fontSize: 11, fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 100,
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.center,
                  child: Consumer<Favorites>(
                    builder: (context, value, child) =>
                        value.restaurants.contains(_restaurant.id)
                            ? IconButton(
                                onPressed: () {
                                  value.toggleFavorite(_restaurant.id);
                                },
                                icon: Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                ),
                              )
                            : IconButton(
                                onPressed: () {
                                  value.toggleFavorite(_restaurant.id);
                                },
                                icon: Icon(
                                  Icons.favorite_border,
                                  color: Colors.grey,
                                ),
                              ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
