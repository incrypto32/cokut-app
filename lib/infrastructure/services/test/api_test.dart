import 'package:cokut/infrastructure/services/api.dart';

void main() async {
  var api = Api();
  print("1");
  try {
    var a = await api.getMeals("TEST_TOKEN", rid: "5f6307c925f7fd7485853558");
    print(a);
  } catch (e) {
    print(e.message);
  }

  print("2");
}
