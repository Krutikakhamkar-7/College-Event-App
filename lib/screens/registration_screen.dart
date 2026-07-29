import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() =>
      _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
   final nameController = TextEditingController();
  final emailController = TextEditingController();
  final departmentController = TextEditingController();
  final yearController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Event Registration"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: "Full Name",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: departmentController,
              decoration: const InputDecoration(
                labelText: "Department",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: yearController,
              decoration: const InputDecoration(
                labelText: "Year",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  try {
                    await FirebaseFirestore.instance
                        .collection('registrations')
                        .add({
                      'uid': FirebaseAuth.instance.currentUser!.uid,
                      'name': nameController.text.trim(),
                      'email': emailController.text.trim(),
                      'department': departmentController.text.trim(),
                      'year': yearController.text.trim(),
                      'timestamp': FieldValue.serverTimestamp(),
                    });

                    if (!mounted) return;
                    nameController.clear();
                    emailController.clear();
                    departmentController.clear();
                    yearController.clear();
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text("Registration Successful 🎉"),
                        content: const Text(
                          "You have successfully registered for this event.",
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.pop(context);
                            },
                            child: const Text("OK"),
                          ),
                        ],
                      ),
                    );
                  } catch (e) {
                    print(e);

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Error: $e"),
                      ),
                    );
                  }
                },
                child: const Text("Register"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    departmentController.dispose();
    yearController.dispose();
    super.dispose();
  }
}