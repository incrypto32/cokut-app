import 'package:cokut/models/user.dart';

void main() {
  var a =
      Address(adl1: "1", adl2: "2", adl3: "3", title: "my address", zone: "z1");
  print(a.toJson());
  a.adl1 = "blah";
  print(a.toJson());
  print(Address.fromJson(a.toJson()).toJson());
}
