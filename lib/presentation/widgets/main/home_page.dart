import 'package:carousel_slider/carousel_slider.dart';
import 'package:cokut/cubit/restaurant_cubit/restaurant_cubit.dart';
import 'package:cokut/presentation/widgets/components/loading_shimmer.dart';
import 'package:cokut/presentation/widgets/components/restaurant_error.dart';
import 'package:cokut/presentation/widgets/components/restaurant_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
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
              // ...[
              //   buildCategoryStack(
              //     context,
              //     asset: 'assets/images/special.png',
              //     category: "Specials",
              //   ),
              //   buildCategoryStack(
              //     context,
              //     asset: 'assets/images/restaurants.png',
              //     category: "Restaurants",
              //     opposite: true,
              //   ),
              //   buildCategoryStack(
              //     context,
              //     asset: 'assets/images/homemade.png',
              //     category: "Homemade",
              //   ),
              //   buildCategoryStack(
              //     context,
              //     asset: 'assets/images/spicey.png',
              //     category: "Spicey",
              //     opposite: true,
              //   ),
              // ],
              Container(
                width: double.infinity,
                height: 100,
                // color: Colors.amber,
                child: DefaultTextStyle(
                  style: TextStyle(color: Colors.grey[700]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      buildHomeIcon(
                        context,
                        asset: 'assets/images/home/hamburger.png',
                        name: "Specials",
                      ),
                      buildHomeIcon(
                        context,
                        asset: 'assets/images/home/store.png',
                        name: "Restaurants",
                      ),
                      buildHomeIcon(
                        context,
                        asset: 'assets/images/home/home.png',
                        name: "Homemade",
                      ),
                      buildHomeIcon(
                        context,
                        asset: 'assets/images/home/seasoning.png',
                        name: "Spicey",
                      ),
                    ],
                  ),
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
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Spacer(),
                    Icon(Icons.filter_list),
                  ],
                ),
              ),
              BlocBuilder<RestaurantCubit, RestaurantState>(
                  builder: (context, state) {
                if (state is RestaurantLoading) {
                  return LoadingShimmer();
                } else if (state is RestaurantsLoaded) {
                  return Container(
                    // padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                    // child: ListView.builder(
                    //   itemCount: state.restaurants.length,
                    //   itemBuilder: (context, index) =>
                    //       RestaurantTile(state.restaurants[index]),
                    // ),
                    child: Column(
                      children: [
                        ...state.restaurants
                            .map((e) => RestaurantTile(e))
                            .toList()
                      ],
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

  Widget buildCategoryStack(BuildContext context,
      {String asset, bool opposite = false, String category}) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed("/" + category.toLowerCase());
      },
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: 10,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Container(
            color: Colors.blueGrey,
            child: Stack(
              children: [
                Image.asset(
                  asset,
                  width: double.infinity,
                  fit: BoxFit.fitWidth,
                ),
                Positioned.fill(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 45),
                    alignment:
                        opposite ? Alignment.centerLeft : Alignment.centerRight,
                    child: Text(
                      category,
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
