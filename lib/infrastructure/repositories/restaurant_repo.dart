import 'package:cokut/infrastructure/services/api.dart';
import 'package:cokut/models/restaurant.dart';

class RestaurantRepository {
  Api _api = Api();

  Future<List<Restaurant>> getRestaurants(String token) async {
    var restaurantList = await _api.getRestaurants(token);
    return restaurantList.map((e) => Restaurant.fromJson(e)).toList();
  }

  Future<List<Restaurant>> getAllRestaurants(String token) async {
    var restaurantList = await _api.getAllRestaurants(token);
    return restaurantList.map((e) => Restaurant.fromJson(e)).toList();
  }

  Future<List<Restaurant>> getHomeMadeStores(String token) async {
    var restaurantList = await _api.getRestaurants(token, isHomeMade: true);
    return restaurantList.map((e) => Restaurant.fromJson(e)).toList();
  }
}
