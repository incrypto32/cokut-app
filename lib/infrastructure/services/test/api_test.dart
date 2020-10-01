import 'package:cokut/infrastructure/services/api.dart';
import 'package:cokut/models/user.dart';

void main() async {
  var api = Api();

  print("1");
  try {
    var testaddr = {
      "adl1": "Address line 1",
      "adl2": "Address line 1",
      "adl3": "Address line 1",
      "zone": "ZONE",
    };
    var a = await api.removeAddress(token: "TEST_TOKEN", address: testaddr);
    var b = await api.addAddress(token: "TEST_TOKEN", address: testaddr);
    var c = await api.getUser("TEST_TOKEN");
    var address = Address.fromJson(c["address"][0]);
    print(address);
    print(Address.fromJson(testaddr));
    print(address == Address.fromJson(testaddr));
  } catch (e) {
    print(e);
  }

  print("2");
}
