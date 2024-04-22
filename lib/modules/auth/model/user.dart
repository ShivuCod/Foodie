class User {
  String name;
  String password;
  String confirmPassword;
  String username;
  String email;

  User({
    required this.name,
    required this.password,
    required this.confirmPassword,
    required this.username,
    required this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'] ?? '',
      password: json['password'] ?? '',
      confirmPassword: json['confirmPassword'] ?? '',
      username: json['username'] ?? '',
      email: json['email'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'password': password,
      'confirmPassword': confirmPassword,
      'username': username,
      'email': email,
    };
  }
}
