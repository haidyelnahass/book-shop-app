import 'dart:convert';

import 'package:booklibraryapp/classes/login.dart';
import 'package:booklibraryapp/classes/signup.dart';
import 'package:http/http.dart' as http;

Future<Login> login(String email, String password) async {
  print('currently here');
  final response = await http.post(
    Uri.parse('http://localhost:8000/login'),
    headers: <String, String>{
      'Content-Type': 'application/json',
      'Access-Control-Allow-Origin': '*',
      'Access-Control-Allow-Methods': 'GET, POST, PUT, PATCH, DELETE',
      'Access-Control-Allow-Headers': 'Content-Type, Authorization',
      'Accept': '*/*',
    },
    body: jsonEncode(<String, String>{
      'email': email,
      'password': password,
    }),
  );

  if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return Login.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to login.');
  }
}

Future<Signup> signup(String email, String password, String name) async {
  print('currently here');
  final response = await http.post(
    Uri.parse('http://localhost:8000/signup'),
    headers: <String, String>{
      'Content-Type': 'application/json',
      'Access-Control-Allow-Origin': '*',
      'Access-Control-Allow-Methods': 'GET, POST, PUT, PATCH, DELETE',
      'Access-Control-Allow-Headers': 'Content-Type, Authorization',
      'Accept': '*/*',
    },
    body: jsonEncode(<String, String>{
      'email': email,
      'password': password,
      'name': name,
    }),
  );

  if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return Signup.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to signup.');
  }
}
