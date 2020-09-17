class User {
  User({
    this.uid,
    this.name,
    this.email,
    this.phone,
    this.address,
  });
  final String name;
  final String uid;
  final String phone;
  final String email;
  final List<Address> address;
}

class Address {
  Address({
    this.pincode,
    this.address,
    this.zone,
  });
  final String pincode;
  final String address;
  final String zone;
}
