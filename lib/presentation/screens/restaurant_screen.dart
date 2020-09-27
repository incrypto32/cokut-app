import 'package:cokut/common/constants.dart';
import 'package:cokut/cubit/restaurant_cubit/restaurant_cubit.dart';
import 'package:cokut/infrastructure/repositories/auth_repo.dart';
import 'package:cokut/infrastructure/repositories/restaurant_repo.dart';
import 'package:cokut/presentation/widgets/components/loading_shimmer.dart';
import 'package:cokut/presentation/widgets/components/restaurant_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RestaurantScreen extends StatelessWidget {
  final bool isHomeMade;
  const RestaurantScreen({this.isHomeMade = false});

  @override
  Widget build(BuildContext context) {
    final RestaurantCubit _restaurantCubit = RestaurantCubit(
      context.repository<RestaurantRepository>(),
      context.repository<AuthenticationRepository>(),
      isHomeMade: isHomeMade,
    );

    final Function reload = () => _restaurantCubit.getRestaurants();

    return Scaffold(
      backgroundColor: ColorIt.hexToColor(ColorIt.mainBody),
      body: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(60),
            ),
            child: Stack(
              children: [
                Image.asset(
                  'assets/images/specials.png',
                  width: double.infinity,
                  alignment: Alignment.centerLeft,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 40,
                  left: 0,
                  right: 0,
                  child: Text(
                    isHomeMade ? "Homemade" : "Restaurants",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline3.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(color: Colors.black, blurRadius: 10),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: BlocBuilder<RestaurantCubit, RestaurantState>(
                cubit: _restaurantCubit,
                builder: (context, state) {
                  if (state is RestaurantLoading) {
                    return LoadingShimmer();
                  } else if (state is RestaurantsLoaded) {
                    return Container(
                      padding: EdgeInsets.all(20),
                      child: ListView.builder(
                        itemCount: state.restaurants.length,
                        itemBuilder: (context, index) =>
                            RestaurantTile(state.restaurants[index]),
                      ),
                    );
                  }
                  if (state is RestaurantsError) {
                    print(state.message);
                    return RestaurantErrorWidget(
                      reload: reload,
                      message: state.message,
                    );
                  }
                  return RestaurantErrorWidget(
                    reload: reload,
                    message: "",
                  );
                }),
          ),
        ],
      ),
    );
  }
}

class RestaurantErrorWidget extends StatelessWidget {
  final Function reload;
  final String message;
  const RestaurantErrorWidget({
    Key key,
    this.reload,
    this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: Image.asset(
            'assets/images/error.png',
            height: 150,
          ),
        ),
        Text(
          message ?? "An error occured",
          style: TextStyle(color: Colors.red),
        ),
        FlatButton(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Retry"),
              Icon(Icons.replay),
            ],
          ),
          onPressed: reload,
        ),
      ],
    );
  }
}
