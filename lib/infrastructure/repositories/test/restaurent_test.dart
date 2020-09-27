import 'package:cokut/infrastructure/repositories/restaurant_repo.dart';

void main() async {
  var r = RestaurantRepository();
  try {
    var l = await r.getRestaurants("TEST_TOKEN");
    print(l);
  } catch (e) {
    print(e);
  }
}
