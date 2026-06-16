import 'package:flutter/material.dart';
import 'registration_screen.dart';

class EventDetailsScreen extends StatelessWidget {
  final String title;
  final String date;

  const EventDetailsScreen({
    super.key,
    required this.title,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              date,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "This event is organized for students interested in technology, innovation and networking opportunities.",
              style: TextStyle(fontSize: 18),
            ),

            const Spacer(),

            SizedBox(
  width: double.infinity,
  child: ElevatedButton(
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const RegistrationScreen(),
        ),
      );
    },
    child: const Text("Register Now"),
  ),
),
          ],
        ),
      ),
    );
  }
}