import 'package:flutter/material.dart';
import 'event_details_screen.dart';
import 'profile_screen.dart';
import 'my_registrations_screen.dart';
import 'signup_screen.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("College Events"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            ElevatedButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const MyRegistrationsScreen(),
      ),
    );
  },
  child: const Text("View Registrations"),
),
            Container(
  width: double.infinity,
  padding: const EdgeInsets.all(20),
  decoration: BoxDecoration(
    color: Colors.deepPurple,
    borderRadius: BorderRadius.circular(20),
  ),
  child: const Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "FEATURED EVENT",
        style: TextStyle(
          color: Colors.white70,
          fontSize: 14,
        ),
      ),
      SizedBox(height: 10),
      Text(
        "National Hackathon 2026",
        style: TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(height: 8),
      Text(
        "Win prizes, showcase skills and get internship opportunities.",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    ],
  ),
),

const SizedBox(height: 25),
            SizedBox(height: 20),

TextField(
  decoration: InputDecoration(
    hintText: "Search events...",
    prefixIcon: Icon(Icons.search),
  ),
),

SizedBox(height: 20),

Container(
  height: 180,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(20),
    gradient: LinearGradient(
      colors: [
        Colors.deepPurple,
        Colors.purple,
      ],
    ),
  ),
),

SizedBox(height: 20),

            const Text(
              "Upcoming Events",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),
              Container(
  height: 180,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(20),
    gradient: const LinearGradient(
      colors: [
        Colors.deepPurple,
        Colors.purple,
      ],
    ),
  ),
  child: const Padding(
    padding: EdgeInsets.all(20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Hackathon 2026",
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Text(
          "Join the biggest coding event of the year!",
          style: TextStyle(
            color: Colors.white70,
            fontSize: 16,
          ),
        ),
      ],
    ),
  ),
),
            eventCard(
              context,
              "Hackathon 2026",
              "15 June 2026",
              Icons.code,
            ),

            eventCard(
              context,
              "Tech Fest",
              "20 June 2026",
              Icons.computer,
            ),

            eventCard(
              context,
              "AI Workshop",
              "25 June 2026",
              Icons.smart_toy,
            ),
          ],
        ),
      ),

     bottomNavigationBar: BottomNavigationBar(
  onTap: (index) {
    if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ProfileScreen(),
        ),
      );
    }
  },
  items: const [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: "Home",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.event),
      label: "Events",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: "Profile",
    ),
  ],
),
    );
  }

 Widget eventCard(
  BuildContext context,
  String title,
  String date,
  IconData icon,
) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      child: ListTile(
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EventDetailsScreen(
          title: title,
          date: date,
        ),
      ),
    );
  },

  leading: Icon(
    icon,
    size: 40,
  ),
        title: Text(title),
        subtitle: Text(date),
        trailing: ElevatedButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SignupScreen(),
      ),
    );
  },
  child: const Text("Sign Up"),
),
      ),
    );
  }
}