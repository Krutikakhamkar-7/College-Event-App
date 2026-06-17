import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/signup_screen.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const CollegeEventApp());
}

class CollegeEventApp extends StatelessWidget {
  const CollegeEventApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SignupScreen(),
    );
  }
}