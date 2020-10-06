import 'package:cokut/common/constants.dart';
import 'package:cokut/cubit/restaurant_cubit/restaurant_cubit.dart';
import 'package:cokut/presentation/widgets/components/cart_reminder_frame.dart';
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
            child: BlocBuilder<RestaurantCubit, RestaurantState>(
                builder: (context, state) {
              if (state is RestaurantLoading) {
                return LoadingShimmer();
              } else if (state is RestaurantsLoaded) {
                var list = isHomeMade
                    ? state.restaurants
                        .where((element) => element.type == "homemade")
                        .toList()
                    : state.restaurants.toList();
                if (list.length == 0) {
                  return RestaurantErrorWidget(
                    reload: context.bloc<RestaurantCubit>().getRestaurants,
                    message: "Nothing Here",
                  );
                }

                return CartReminderFrame(
                  child: ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (context, index) => Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                      child: RestaurantTile(list[index]),
                    ),
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
        ],
      ),
    );
  }
}
