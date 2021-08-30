import 'package:booklibraryapp/app-bar.dart';
import 'package:booklibraryapp/drawer-menu.dart';
import 'package:booklibraryapp/home-screen.dart';
import 'package:booklibraryapp/login-screen.dart';
import 'package:flutter/material.dart';

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
        primarySwatch: Colors.purple,
        primaryColor: Colors.white,
        textTheme: TextTheme(
          title: TextStyle(color: Colors.black),
        ),
      ),
      routes: {
        '/': (context) => HomeScreen(),
        '/login': (context) => LoginScreen(),
      },
    );
  }
}
