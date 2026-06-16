import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const CollegeEventApp());
}

class CollegeEventApp extends StatelessWidget {
  const CollegeEventApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}