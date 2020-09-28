import 'package:cokut/infrastructure/services/api.dart';
import 'package:cokut/models/meal.dart';
import 'package:cokut/utils/logger.dart';

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
        await _api.getMeals(token, rid: rid, endpoint: "/getspecials");
    return mealList.map((e) => Meal.fromJson(e)).toList();
  }

  Future<List<Meal>> getSpicey({String token, String rid}) async {
    logger.d(rid);
    var mealList = await _api.getMeals(token, rid: rid, endpoint: "/getspicey");
    return mealList.map((e) => Meal.fromJson(e)).toList();
  }
}
