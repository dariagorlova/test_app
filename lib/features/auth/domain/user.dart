class User {
  User({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  String email;
  String firstName;
  String lastName;
  String avatar;

  factory User.fromJson(Map<String, dynamic> json) => User(
        email: json["email"],
        firstName: json["name"]["first"],
        lastName: json["name"]["last"],
        avatar: json["picture"]["thumbnail"],
      );
}
