
class User {
  final String? phone;
  final String? email;
  final String password;
  final String username;

  User({
    this.phone,
    this.email,
    required this.password,
    required this.username,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      phone: json['phone'],
      email: json['email'],
      password: json['password'],
      username: json['username'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'phone': phone,
      'email': email,
      'password': password,
      'username': username,
    };
  }
}
