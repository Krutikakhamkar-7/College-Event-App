import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'login_screen.dart';
import 'my_registrations_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();

    if (!context.mounted) return;

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              child: Icon(
                Icons.person,
                size: 50,
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "Student Name",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const Text("IT Department"),

            const SizedBox(height: 30),

            ListTile(
              leading: const Icon(Icons.event),
              title: const Text("My Registrations"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const MyRegistrationsScreen(),
                  ),
                );
              },
            ),

            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Logout"),
              onTap: () {
                logout(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}