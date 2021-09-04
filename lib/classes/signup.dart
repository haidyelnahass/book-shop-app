class Signup {
  final String name;
  final String email;
  final String password;
  Signup({required this.name, required this.email, required this.password});

  factory Signup.fromJson(Map<String, dynamic> json) {
    return Signup(
      name: json['name'],
      email: json['email'],
      password: json['password'],
    );
  }
}
