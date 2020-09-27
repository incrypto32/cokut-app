import 'package:cokut/infrastructure/services/api.dart';

void main() async {
  var api = Api();
  print("1");
  try {
    var a = await api.getRestaurants("TEST_TOKEN");
    print(a);
  } catch (e) {
    print(e);
  }

  print("2");
}
