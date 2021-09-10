import 'package:booklibraryapp/screens/books-screen.dart';
import 'package:flutter/material.dart';

import 'screens/home-screen.dart';
import 'screens/login-screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryTextTheme: TextTheme().apply(
          displayColor: Colors.black,
          bodyColor: Colors.black,
        ),
        primaryColor: Colors.white,
        primarySwatch: Colors.purple,
      ),
      routes: {
        '/': (context) => HomeScreen(),
        '/login': (context) => LoginScreen(),
        '/books': (context) => BooksScreen(),
      },
    );
  }
}
