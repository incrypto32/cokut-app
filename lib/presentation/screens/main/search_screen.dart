import 'package:cokut/common/constants.dart';
import 'package:cokut/cubit/meals_cubit/meals_cubit.dart';
import 'package:cokut/cubit/restaurant_cubit/restaurant_cubit.dart';
import 'package:cokut/cubit/search/search_cubit.dart';
import 'package:cokut/infrastructure/repositories/meals_repo.dart';
import 'package:cokut/infrastructure/repositories/restaurant_repo.dart';
import 'package:cokut/presentation/widgets/animation/fade.dart';
import 'package:cokut/presentation/widgets/components/error/restaurant_error.dart';
import 'package:cokut/presentation/widgets/components/loading/loading_shimmer.dart';
import 'package:cokut/presentation/widgets/components/tiles/meal_tile.dart';
import 'package:cokut/presentation/widgets/components/tiles/restaurant_tile.dart';
import 'package:cokut/utils/logger.dart';
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
    return BlocProvider<SearchCubit>(
      create: (context) => SearchCubit(
        mealsRepository: context.repository<MealsRepository>(),
        restaurantRepository: context.repository<RestaurantRepository>(),
      ),
      child: FadeTransitionWidget(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Builder(
              builder: (context) {
                return Container(
                  margin: EdgeInsets.all(10),
                  child: TextField(
                    cursorColor: Colors.grey[700],
                    cursorWidth: 1.5,
                    onSubmitted: (value) {
                      logger.i("Pressed search");
                      context.bloc<SearchCubit>().searchMeals(value);
                      logger.i("Hmm");
                    },
                    textInputAction: TextInputAction.search,
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
                        borderSide: BorderSide(
                          color: Colors.grey[700],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            selectType(context),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: _isFood ? buildFoods() : buildRestaurants(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRestaurants(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        var cubit = context.bloc<SearchCubit>();
        if (cubit.keyword == null) {
          return Center(
            child: Icon(
              Icons.search,
              size: 100,
              color: Colors.grey,
            ),
          );
        }
        return ListView(
          children: cubit.search().map((e) => RestaurantTile(e)).toList(),
        );
      },
    );
  }

  BlocBuilder<SearchCubit, SearchState> buildFoods() {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchInitial) {
          return Center(
            child: Icon(
              Icons.search,
              size: 100,
              color: Colors.grey,
            ),
          );
        } else if (state is SearchLoading) {
          return SingleChildScrollView(child: LoadingShimmer());
        } else if (state is SearchResults) {
          if (state.meals == null || state.meals.length == 0) {
            return Center(
              child: Text("EMPTY"),
            );
          }
          return ListView(
            children: state.meals
                .map(
                  (e) => MealTile(
                    meal: e,
                    isSearch: true,
                  ),
                )
                .toList(),
          );
        }
        if (state is SearchError) {
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
        return Center(
          child: Icon(
            Icons.search,
            size: 100,
            color: Colors.grey,
          ),
        );
      },
    );
  }

  Row selectType(BuildContext context) {
    return Row(
      children: [
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
                color: _isFood ? Colors.white : Colors.green,
                child: Text(
                  "RESTAURANT",
                  style: Theme.of(context).textTheme.headline6.copyWith(
                      fontWeight: FontWeight.bold,
                      color: _isFood ? Colors.blueGrey : Colors.white),
                ),
              ),
            ),
          ),
        ),
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
                color: _isFood ? Colors.green : Colors.white,
                child: Text(
                  "FOOD",
                  style: Theme.of(context).textTheme.headline6.copyWith(
                      fontWeight: FontWeight.bold,
                      color: _isFood ? Colors.white : Colors.blueGrey),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
