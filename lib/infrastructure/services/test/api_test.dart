import 'package:cokut/infrastructure/services/api.dart';
import 'package:cokut/models/order.dart';

void main() async {
  var api = Api();

  print("1");
  try {
    var orderData = {
      "rid": "5f6307c925f7fd7485853558",
      "address": "Matte Hotel 86940",
      "items": {"5f6307ea25f7fd7485853559": 2}
    };
    var data = await api.order(orderData, "TEST_TOKEN");
    print(data);
    print("blah");
    var order = Order.fromJson(data["order"]);
    print("blah2");

    print(order.toJson());
  } catch (e) {
    print(e);
  }

  print("2");
}
