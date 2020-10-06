import 'package:cokut/infrastructure/services/api.dart';
import 'package:cokut/models/restaurant.dart';

class RestaurantRepository {
  Api _api = Api();
  Map<String, Restaurant> _restaurants = {};

  Map<String, Restaurant> get restaurants => _restaurants;

  Future<List<Restaurant>> getRestaurants(String token) async {
    var restaurantList = await _api.getRestaurants(token);
    createMap(restaurantList);
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

  Future<void> createMap(List<Map<String, dynamic>> restaurantList) {
    restaurantList.forEach((element) {
      _restaurants.putIfAbsent(
        element["id"],
        () => Restaurant.fromJson(element),
      );
    });
    return null;
  }
}
