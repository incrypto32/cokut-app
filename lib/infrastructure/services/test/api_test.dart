import 'package:cokut/infrastructure/services/api.dart';
import 'package:cokut/models/order.dart';

void main() async {
  var api = Api();

  print("1");
  try {
    var data = await api.getOrders("TEST_TOKEN");
    print(data);
    print("blah");

    print("blah2");
  } catch (e) {
    print(e);
  }

  print("2");
}
