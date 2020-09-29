import 'package:cokut/cubit/meals_cubit/meals_cubit.dart';
import 'package:cokut/infrastructure/repositories/auth_repo.dart';
import 'package:cokut/infrastructure/repositories/meals_repo.dart';
import 'package:cokut/models/meal.dart';
import 'package:cokut/presentation/widgets/components/loading_shimmer.dart';
import 'package:cokut/presentation/widgets/components/meal_item.dart';
import 'package:cokut/presentation/widgets/components/page_cover.dart';
import 'package:cokut/presentation/widgets/components/restaurant_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MealCategoryScreen extends StatelessWidget {
  final MealType mealType;
  const MealCategoryScreen({this.mealType = MealType.regular});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          PageCover(heading: "Specials"),
          Expanded(
            child: BlocProvider<MealsCubit>(
              create: (context) => MealsCubit(
                context.repository<MealsRepository>(),
                context.repository<AuthenticationRepository>(),
                mealType: mealType,
              ),
              child: BlocBuilder<MealsCubit, MealsState>(
                builder: (context, state) {
                  if (state is MealsInitial) {
                    return LoadingShimmer();
                  } else if (state is MealsLoading) {
                    return LoadingShimmer();
                  } else if (state is MealsLoaded) {
                    return state.meals.length > 0
                        ? ListView.builder(
                            itemCount: state.meals.length,
                            itemBuilder: (context, index) => MealTile(
                              name: state.meals[index].name,
                              hotel: "",
                              price: state.meals[index].displayPrize,
                              count: 0,
                            ),
                          )
                        : RestaurantErrorWidget(message: "Nothing Here ");
                  } else if (state is MealsError) {
                    return RestaurantErrorWidget(
                      message: state.message ?? "An error occured",
                      reload: () {},
                    );
                  }
                  return RestaurantErrorWidget(
                    message: "An error occured",
                    reload: () {},
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
