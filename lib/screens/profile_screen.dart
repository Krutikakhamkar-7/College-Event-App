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
     body: SingleChildScrollView(
  child: Column(
    children: [

      Container(
        width: double.infinity,
        padding: const EdgeInsets.only(
          top: 40,
          bottom: 35,
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
        child: Column(
          children: [

            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.white,
              child: Icon(
                Icons.person,
                size: 55,
                color: Colors.deepPurple,
              ),
            ),

            const SizedBox(height: 18),

            const Text(
              "Student Name",
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              FirebaseAuth.instance.currentUser?.email ??
                  "student@email.com",
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),

      const SizedBox(height: 30),

      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [

            Expanded(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.deepPurple.shade50,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: const Column(
                  children: [

                    Icon(
                      Icons.event_available,
                      color: Colors.deepPurple,
                      size: 35,
                    ),

                    SizedBox(height: 10),

                    Text(
                      "Registered",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 5),

                    Text(
                      "0",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(width: 18),

            Expanded(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.deepPurple.shade50,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: const Column(
                  children: [

                    Icon(
                      Icons.emoji_events,
                      color: Colors.deepPurple,
                      size: 35,
                    ),

                    SizedBox(height: 10),

                    Text(
                      "Events",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 5),

                    Text(
                      "4",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),

           Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [

            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              child: ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Color(0xffEEE5FF),
                  child: Icon(
                    Icons.event,
                    color: Colors.deepPurple,
                  ),
                ),
                title: const Text(
                  "My Registrations",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: const Text(
                  "View all registered events",
                ),
                trailing: const Icon(Icons.arrow_forward_ios),
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
            ),

            const SizedBox(height: 18),

            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              child: ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Color(0xffFFE5E5),
                  child: Icon(
                    Icons.logout,
                    color: Colors.red,
                  ),
                ),
                title: const Text(
                  "Logout",
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: const Text(
                  "Sign out from your account",
                ),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  logout(context);
                },
              ),
            ),

            const SizedBox(height: 35),

          ],
        ),
      ),

    ],
  ),
),
    );
  }
}
