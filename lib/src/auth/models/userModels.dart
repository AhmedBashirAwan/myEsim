class User {
  final String email;
  final String name;
  final String userId;

  User({
    required this.email,
    required this.name,
    required this.userId,
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      email: map['email'],
      name: map['name'],
      userId: map['user_ID'],
    );
  }
}
