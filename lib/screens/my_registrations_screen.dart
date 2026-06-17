import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyRegistrationsScreen extends StatelessWidget {
  const MyRegistrationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Registrations"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('registrations')
            .where(
              'uid',
              isEqualTo: FirebaseAuth.instance.currentUser!.uid,
            )
            .orderBy('timestamp', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error: ${snapshot.error}',
              ),
            );
          }

          final registrations = snapshot.data?.docs ?? [];

          if (registrations.isEmpty) {
            return const Center(
              child: Text(
                'No registrations found.',
                style: TextStyle(fontSize: 18),
              ),
            );
          }

          return ListView.builder(
            itemCount: registrations.length,
            itemBuilder: (context, index) {
              final data =
                  registrations[index].data() as Map<String, dynamic>;

              return Card(
                margin: const EdgeInsets.all(10),
                child: ListTile(
                  title: Text(
                    data['name'] ?? '',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Email: ${data['email'] ?? ''}"),
                      Text(
                        "Department: ${data['department'] ?? ''}",
                      ),
                      Text("Year: ${data['year'] ?? ''}"),
                    ],
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () async {
                      await registrations[index]
                          .reference
                          .delete();
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}