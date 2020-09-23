class User {
  User({
    this.uid,
    this.name,
    this.email,
    this.phone,
    this.address,
    this.registered,
  });
  final String name;
  final String uid;
  final String phone;
  final String email;
  bool registered = true;
  final List<Address> address;

  static User fromJson(Map<String, dynamic> map) {
    return User(
      uid: map["uid"],
      address: map["address"],
      email: map["email"],
      name: map["name"],
      phone: map["phone"],
    );
  }
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
