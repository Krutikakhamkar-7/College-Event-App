import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'home_screen.dart';
import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _obscurePassword = true;
@override
void dispose() {
  emailController.dispose();
  passwordController.dispose();
  super.dispose();
}
@override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: const Color(0xffF6F5FB),

    body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [

            // ================= HEADER =================

            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(
                top: 45,
                bottom: 40,
              ),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xff5B2EFF),
                    Color(0xffA100FF),
                  ],
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(35),
                  bottomRight: Radius.circular(35),
                ),
              ),
              child: const Column(
                children: [

                  CircleAvatar(
                    radius: 42,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.school,
                      color: Colors.deepPurple,
                      size: 45,
                    ),
                  ),

                  SizedBox(height: 18),

                  Text(
                    "Welcome Back 👋",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 8),

                  Text(
                    "Login to continue",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 35),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Column(
                children: [

                  TextField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.email),
                      hintText: "Email Address",
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 18,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide(
                          color: Colors.grey.shade300,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: const BorderSide(
                          color: Colors.deepPurple,
                          width: 2,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                 TextField(
  controller: passwordController,
  obscureText: _obscurePassword,
  textInputAction: TextInputAction.done,
  decoration: InputDecoration(
    prefixIcon: const Icon(Icons.lock),
                      hintText: "Password",
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 18,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide(
                          color: Colors.grey.shade300,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: const BorderSide(
                          color: Colors.deepPurple,
                          width: 2,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Forgot Password?",
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        foregroundColor: Colors.white,
                        elevation: 6,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      onPressed: () async {
                        try {
                          await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                            email: emailController.text.trim(),
                            password: passwordController.text.trim(),
                          );

                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const HomePage(),
                            ),
                          );
                        } on FirebaseAuthException catch (e) {
                          String message = "Something went wrong";

                          if (e.code == "user-not-found") {
                            message = "No account found with this email.";
                          } else if (e.code == "wrong-password") {
                            message = "Incorrect password.";
                          } else if (e.code == "invalid-email") {
                            message = "Enter a valid email.";
                          } else if (e.code == "invalid-credential") {
                            message = "Invalid email or password.";
                          }

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(message)),
                          );
                        }
                      },
                      child: const Text(
                        "LOGIN",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  const Row(
                    children: [
                      Expanded(child: Divider()),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 12),
                        child: Text("OR"),
                      ),
                      Expanded(child: Divider()),
                    ],
                  ),

                  const SizedBox(height: 25),

                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              const SignupScreen(),
                        ),
                      );
                    },
                    child: RichText(
                      text: const TextSpan(
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 16,
                        ),
                        children: [
                          TextSpan(
                            text:
                                "Don't have an account? ",
                          ),
                          TextSpan(
                            text: "Sign Up",
                            style: TextStyle(
                              color: Colors.deepPurple,
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),

                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
}