import 'package:carros/screens/login/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(
            fontSize: 25,
            color: Colors.grey,
          ),
          hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
        ),
      ),
      home: LoginScreen(),
    );
  }
}
