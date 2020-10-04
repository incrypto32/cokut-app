import 'package:cokut/infrastructure/services/api.dart';
import 'package:cokut/models/user.dart';

void main() async {
  var api = Api();

  print("1");
  try {
    print("____-");
    var testaddr = {
      "title": "TITLE",
      "adl1": "Address line 1",
      "adl2": "Address line 1",
      "adl3": "Address line 1",
      "zone": "ZONE",
    };
    var a = await api.removeAddress(token: "TEST_TOKEN", address: testaddr);
    print(a);
    var b = await api.addAddress(token: "TEST_TOKEN", address: testaddr);
    print(b);
    print("hi");
    var c = await api.getUser("TEST_TOKEN");
    print(c);
    var address = Address.fromJson(
        ((c["address"] as Map<String, dynamic>).values.toList())[0]);
    print(address);
    print(Address.fromJson(testaddr));
    print(address == Address.fromJson(testaddr));
  } catch (e) {
    print(e);
  }

  print("2");
}
