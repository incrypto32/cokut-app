import 'package:cokut/infrastructure/services/api.dart';
import 'package:cokut/models/meal.dart';
import 'package:cokut/utils/logger.dart';
import 'package:dio/dio.dart';

class MealsRepository {
  Api _api = Api();

  Future<List<Meal>> getMeals({String token, String rid}) async {
    logger.d(rid);
    var mealList = await _api.getMeals(token, rid: rid);
    return mealList.map((e) => Meal.fromJson(e)).toList();
  }

  Future<List<Meal>> getSpecials({String token, String rid}) async {
    logger.d(rid);
    var mealList =
        await _api.getMeals(token, rid: rid, endpoint: "/meals/specials");
    return mealList.map((e) => Meal.fromJson(e)).toList();
  }

  Future<List<Meal>> getSpicey({String token, String rid}) async {
    logger.d(rid);
    var mealList =
        await _api.getMeals(token, rid: rid, endpoint: "/meals/spicey");
    return mealList.map((e) => Meal.fromJson(e)).toList();
  }

  CancelToken searchCancelToken = CancelToken();
  Future<List<Meal>> search({String token, String keyword}) async {
    searchCancelToken?.cancel();
    searchCancelToken = CancelToken();
    var mealList = await _api.search(keyword, token, searchCancelToken);
    return mealList.map((e) => Meal.fromJson(e)).toList();
  }
}
