import 'package:flutter/material.dart';

class Favorites extends ChangeNotifier {
  List<String> _meals = [];
  List<String> _restaurants = [];

  List<String> get meals => _meals;
  List<String> get restaurants => _restaurants;

  void toggleFavorite(String id, {bool isMeal = false}) {
    print(id);
    print(isMeal);
    if (isMeal) {
      print("Here 1");
      meals.contains(id) ? meals.remove(id) : meals.add(id);
    } else {
      print("Here 2");
      restaurants.contains(id) ? restaurants.remove(id) : restaurants.add(id);
    }
    notifyListeners();
  }
}
