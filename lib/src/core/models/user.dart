class User {
  String name;
  String lastname;
  String birthdate;
  String address;
  List<String>? secondaryAddresses;
  String email;
  String password;

  User(
      {required this.name,
      required this.lastname,
      required this.birthdate,
      required this.address,
      this.secondaryAddresses = const [],
      required this.email,
      required this.password});

  User.empty(
      {this.name = "",
      this.lastname = "",
      this.birthdate = "",
      this.address = "",
      this.secondaryAddresses = const [],
      this.email = "",
      this.password = ""});

  void addSecondaryAddres(index, String address) {
    secondaryAddresses = [...secondaryAddresses!, address];
  }
}
