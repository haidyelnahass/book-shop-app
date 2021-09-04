class Login {
  final String token;
  final String userId;

  Login({required this.token, required this.userId});

  factory Login.fromJson(Map<String, dynamic> json) {
    return Login(
      token: json['token'],
      userId: json['userId'],
    );
  }
}
