import 'package:carousel_slider/carousel_slider.dart';
import 'package:cokut/cubit/restaurant_cubit/restaurant_cubit.dart';
import 'package:cokut/infrastructure/repositories/restaurant_repo.dart';
import 'package:cokut/presentation/widgets/animation/fade.dart';
import 'package:cokut/presentation/widgets/components/loading/loading_shimmer.dart';
import 'package:cokut/presentation/widgets/components/error/restaurant_error.dart';
import 'package:cokut/presentation/widgets/components/tiles/restaurant_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget();

  @override
  Widget build(BuildContext context) {
    return FadeTransitionWidget(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Image.asset(
            'assets/images/blaksid.png',
            height: 40,
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: CarouselSlider(
                      options: CarouselOptions(
                        height: 150,
                        viewportFraction: 1.0,
                        disableCenter: true,
                        autoPlay: true,
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                      ),
                      items: [
                        "assets/images/1.jpg",
                        "assets/images/2.jpg",
                      ].map((e) {
                        return Image.asset(
                          e,
                          fit: BoxFit.cover,
                        );
                      }).toList(),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Categories",
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(fontSize: 23),
                  ),
                ),
                FlatButton(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/specials');
                  },
                  child: Image.asset('assets/images/home/cspecials.png'),
                ),
                Container(
                  height: 150,
                  child: Row(
                    children: [
                      Expanded(
                        child: FlatButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed('/restaurants');
                          },
                          child: Image.asset(
                            'assets/images/home/callstores.png',
                            height: 150,
                          ),
                        ),
                      ),
                      Expanded(
                        child: FlatButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed('/homemade');
                          },
                          child: Image.asset(
                            'assets/images/home/chomebakes.png',
                            height: 150,
                          ),
                        ),
                      ),
                      Expanded(
                        child: FlatButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed('/spicey');
                          },
                          child: Image.asset(
                            'assets/images/home/cspicestores.png',
                            height: 150,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      Text(
                        "Restaurants",
                        style: Theme.of(context).textTheme.headline6.copyWith(
                              color: Colors.blueGrey[800],
                              fontSize: 23,
                            ),
                      ),
                      Spacer(),
                      Icon(Icons.filter_list),
                    ],
                  ),
                ),
                BlocBuilder<RestaurantCubit, RestaurantState>(
                    builder: (context, state) {
                  var restaurantsList = context
                      .repository<RestaurantRepository>()
                      .restaurantsList;
                  if (state is RestaurantLoading) {
                    return LoadingShimmer();
                  } else if (state is RestaurantsLoaded) {
                    return Container(
                      child: Column(
                        children: restaurantsList
                            .map((e) => RestaurantTile(e))
                            .toList(),
                      ),
                    );
                  }
                  if (state is RestaurantsError) {
                    print(state.message);
                    return RestaurantErrorWidget(
                      reload: context.bloc<RestaurantCubit>().getRestaurants,
                      message: state.message,
                    );
                  }
                  return RestaurantErrorWidget(
                    reload: context.bloc<RestaurantCubit>().getRestaurants,
                    message: "",
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildHomeIcon(BuildContext context,
      {String asset, String name, String route}) {
    return FlatButton(
      padding: EdgeInsets.all(0),
      onPressed: () =>
          Navigator.of(context).pushNamed('/' + (route ?? name.toLowerCase())),
      child: Container(
        width: 60,
        margin: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.lightGreenAccent[100],
                ),
                child: Image.asset(
                  asset,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            FittedBox(
              child: Text(
                name,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
