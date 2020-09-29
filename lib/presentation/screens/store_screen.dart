import 'package:cokut/cubit/meals_cubit/meals_cubit.dart';
import 'package:cokut/infrastructure/repositories/auth_repo.dart';
import 'package:cokut/infrastructure/repositories/meals_repo.dart';
import 'package:cokut/models/restaurant.dart';
import 'package:cokut/presentation/widgets/components/loading_shimmer.dart';
import 'package:cokut/presentation/widgets/components/meal_item.dart';
import 'package:cokut/presentation/widgets/components/restaurant_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RestaurantScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Restaurant restaurant = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 150,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/restcover.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: DefaultTextStyle(
              style: TextStyle(color: Colors.white),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    restaurant.name ?? "<Restaurant Name>",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline4.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(color: Colors.black, blurRadius: 10),
                      ],
                    ),
                  ),
                  Text(
                    restaurant.address ?? "<Address>",
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: BlocProvider<MealsCubit>(
              create: (context) => MealsCubit(
                context.repository<MealsRepository>(),
                context.repository<AuthenticationRepository>(),
                rid: restaurant.id,
              ),
              child: BlocBuilder<MealsCubit, MealsState>(
                  builder: (context, state) {
                if (state is MealsInitial) {
                  return LoadingShimmer();
                } else if (state is MealsLoading) {
                  return LoadingShimmer();
                } else if (state is MealsLoaded) {
                  return Container(
                    padding: EdgeInsets.all(20),
                    child: ListView.builder(
                      itemCount: state.meals.length,
                      itemBuilder: (context, index) => MealTile(
                        meal: state.meals[index],
                      ),
                    ),
                  );
                }
                if (state is MealsError) {
                  print(state.message);
                  return RestaurantErrorWidget(
                    reload: () {
                      context.bloc<MealsCubit>().getMeals(restaurant.id);
                    },
                    message: state.message,
                  );
                }
                return RestaurantErrorWidget(
                  reload: () {
                    context.bloc<MealsCubit>().getMeals(restaurant.id);
                  },
                  message: "",
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}
