import 'package:cokut/common/constants.dart';
import 'package:cokut/cubit/restaurant_cubit/restaurant_cubit.dart';
import 'package:cokut/infrastructure/repositories/restaurant_repo.dart';
import 'package:cokut/presentation/widgets/components/common/cart_reminder_frame.dart';
import 'package:cokut/presentation/widgets/components/loading/loading_shimmer.dart';
import 'package:cokut/presentation/widgets/components/common/page_cover.dart';
import 'package:cokut/presentation/widgets/components/error/restaurant_error.dart';
import 'package:cokut/presentation/widgets/components/tiles/restaurant_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RestaurantListScreen extends StatelessWidget {
  final bool isHomeMade;
  const RestaurantListScreen({this.isHomeMade = false});

  @override
  Widget build(BuildContext context) {
    var restaurantsList =
        context.repository<RestaurantRepository>().restaurantsList;
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
                    ? restaurantsList
                        .where((element) => element.type == "homemade")
                        .toList()
                    : restaurantsList;
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
