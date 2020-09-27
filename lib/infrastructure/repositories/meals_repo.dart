import 'package:cokut/infrastructure/services/api.dart';
import 'package:cokut/models/meal.dart';

class MealsRepository {
  Api _api = Api();

  Future<List<Meal>> getMeals(String token, String rid) async {
    var mealList = await _api.getMeals(token, rid: rid);
    return mealList.map((e) => Meal.fromJson(e)).toList();
  }
}
