import 'package:cokut/common/constants.dart';
import 'package:cokut/cubit/meals_cubit/meals_cubit.dart';
import 'package:cokut/cubit/restaurant_cubit/restaurant_cubit.dart';
import 'package:cokut/infrastructure/repositories/auth_repo.dart';
import 'package:cokut/infrastructure/repositories/meals_repo.dart';
import 'package:cokut/presentation/widgets/animation/fade.dart';
import 'package:cokut/presentation/widgets/components/loading_shimmer.dart';
import 'package:cokut/presentation/widgets/components/meal_item.dart';
import 'package:cokut/presentation/widgets/components/restaurant_error.dart';
import 'package:cokut/presentation/widgets/components/restaurant_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPage extends StatefulWidget {
  const SearchPage();
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool _isFood = false;
  @override
  Widget build(BuildContext context) {
    return FadeTransitionWidget(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(10),
              child: TextField(
                cursorColor: Colors.grey[700],
                cursorWidth: 1.5,
                decoration: InputDecoration(
                  hintText: " Search Food and Restaurants",
                  hintStyle: TextStyle(fontSize: 20),
                  prefixIcon: Icon(Icons.search),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(1),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(1),
                      borderSide: BorderSide(color: Colors.grey[700])),
                ),
              ),
            ),
            selectType(context),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _isFood ? buildFoods() : buildRestaurants(),
            ),
          ],
        ),
      ),
    );
  }

  BlocBuilder<RestaurantCubit, RestaurantState> buildRestaurants() {
    return BlocBuilder<RestaurantCubit, RestaurantState>(
        builder: (context, state) {
      if (state is RestaurantLoading) {
        return LoadingShimmer();
      } else if (state is RestaurantsLoaded) {
        return Container(
          child: Column(
            children: [
              ...state.restaurants.map((e) => RestaurantTile(e)).toList()
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
    });
  }

  BlocProvider<MealsCubit> buildFoods() {
    return BlocProvider<MealsCubit>(
      create: (context) => MealsCubit(
        context.repository<MealsRepository>(),
        context.repository<AuthenticationRepository>(),
        rid: "5f60214d917395effef49922",
      ),
      child: BlocBuilder<MealsCubit, MealsState>(builder: (context, state) {
        if (state is MealsInitial) {
          return LoadingShimmer();
        } else if (state is MealsLoading) {
          return LoadingShimmer();
        } else if (state is MealsLoaded) {
          return Column(
              children: state.meals
                  .map(
                    (e) => MealTile(meal: e, isSearch: true,),
                  )
                  .toList());
        }
        if (state is MealsError) {
          print(state.message);
          return RestaurantErrorWidget(
            reload: () {
              context
                  .bloc<MealsCubit>()
                  .getMeals(rid: "5f60214d917395effef49922");
            },
            message: state.message,
          );
        }
        return RestaurantErrorWidget(
          reload: () {
            context
                .bloc<MealsCubit>()
                .getMeals(rid: "5f60214d917395effef49922");
          },
          message: "",
        );
      }),
    );
  }

  Row selectType(BuildContext context) {
    return Row(children: [
      Expanded(
          child: Material(
              color: ColorIt.hexToColor(ColorIt.mainBody),
              child: InkWell(
                  onTap: () {
                    setState(() {
                      _isFood = false;
                    });
                  },
                  child: Container(
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.fromLTRB(8, 0, 5, 0),
                      alignment: Alignment.center,
                      color: _isFood ? Colors.white : Colors.blueGrey,
                      child: Text(
                        "RESTAURANT",
                        style: Theme.of(context).textTheme.headline6.copyWith(
                            fontWeight: FontWeight.bold,
                            color: _isFood ? Colors.blueGrey : Colors.white),
                      ))))),
      Expanded(
          child: Material(
              color: ColorIt.hexToColor(ColorIt.mainBody),
              child: InkWell(
                  onTap: () {
                    setState(() {
                      _isFood = true;
                    });
                  },
                  child: Container(
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.fromLTRB(5, 0, 8, 0),
                      alignment: Alignment.center,
                      color: _isFood ? Colors.blueGrey : Colors.white,
                      child: Text(
                        "FOOD",
                        style: Theme.of(context).textTheme.headline6.copyWith(
                            fontWeight: FontWeight.bold,
                            color: _isFood ? Colors.white : Colors.blueGrey),
                      )))))
    ]);
  }
}
