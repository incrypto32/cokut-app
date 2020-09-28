import 'package:cokut/common/constants.dart';
import 'package:cokut/cubit/restaurant_cubit/restaurant_cubit.dart';
import 'package:cokut/infrastructure/repositories/auth_repo.dart';
import 'package:cokut/infrastructure/repositories/restaurant_repo.dart';
import 'package:cokut/presentation/widgets/components/loading_shimmer.dart';
import 'package:cokut/presentation/widgets/components/page_cover.dart';
import 'package:cokut/presentation/widgets/components/restaurant_error.dart';
import 'package:cokut/presentation/widgets/components/restaurant_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RestaurantListScreen extends StatelessWidget {
  final bool isHomeMade;
  const RestaurantListScreen({this.isHomeMade = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorIt.hexToColor(ColorIt.mainBody),
      body: Column(
        children: [
          PageCover(heading: isHomeMade ? "Homemade" : "Restaurants"),
          Expanded(
            child: BlocProvider<RestaurantCubit>(
              create: (ctx) => RestaurantCubit(
                context.repository<RestaurantRepository>(),
                context.repository<AuthenticationRepository>(),
                isHomeMade: isHomeMade,
              ),
              child: BlocBuilder<RestaurantCubit, RestaurantState>(
                  builder: (context, state) {
                if (state is RestaurantLoading) {
                  return LoadingShimmer();
                } else if (state is RestaurantsLoaded) {
                  return Container(
                    padding: EdgeInsets.only(top: 20, left: 20, right: 20),
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
                    reload: context.bloc<RestaurantCubit>().getRestaurants,
                    message: state.message,
                  );
                }
                return RestaurantErrorWidget(
                  reload: context.bloc<RestaurantCubit>().getRestaurants,
                  message: "",
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
