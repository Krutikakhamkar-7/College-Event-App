import 'package:flutter/material.dart';
import 'event_details_screen.dart';
import 'profile_screen.dart';
import 'my_registrations_screen.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

@override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: const Color(0xffF6F5FB),

    appBar: AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.black,
      centerTitle: true,
      title: const Text(
        "College Events",
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),

    body: ListView(
      padding: const EdgeInsets.all(18),
      children: [

        SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const MyRegistrationsScreen(),
                ),
              );
            },
            icon: const Icon(Icons.assignment),
            label: const Text(
              "View My Registrations",
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),

        const SizedBox(height: 20),

        TextField(
          decoration: InputDecoration(
            hintText: "Search Events...",
            prefixIcon: const Icon(Icons.search),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none,
            ),
          ),
        ),

        const SizedBox(height: 25),

        Container(
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            gradient: const LinearGradient(
              colors: [
                Color(0xff5B2EFF),
                Color(0xffA100FF),
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [

              Text(
                "🏆 FEATURED EVENT",
                style: TextStyle(
                  color: Colors.white70,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 15),

              Text(
                "National Hackathon 2026",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 12),

              Row(
                children: [
                  Icon(Icons.calendar_month,
                      color: Colors.white, size: 18),
                  SizedBox(width: 8),
                  Text(
                    "15 August 2026",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),

              SizedBox(height: 10),

              Row(
                children: [
                  Icon(Icons.location_on,
                      color: Colors.white, size: 18),
                  SizedBox(width: 8),
                  Text(
                    "PCCOE, Pune",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),

              SizedBox(height: 10),

              Row(
                children: [
                  Icon(Icons.emoji_events,
                      color: Colors.amber, size: 20),
                  SizedBox(width: 8),
                  Text(
                    "Prize Pool ₹50,000",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),

              SizedBox(height: 18),

              Text(
                "Showcase your coding skills, build innovative projects and win exciting prizes.",
                style: TextStyle(
                  color: Colors.white,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 30),

        const Text(
          "Upcoming Events",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 18),

        eventCard(
          context,
          "National Hackathon 2026",
          "15 August 2026",
          Icons.code,
          Colors.deepPurple,
        ),

        const SizedBox(height: 15),

        eventCard(
          context,
          "AI Workshop",
          "20 August 2026",
          Icons.smart_toy,
          Colors.blue,
        ),

        const SizedBox(height: 15),

        eventCard(
          context,
          "Tech Fest",
          "25 August 2026",
          Icons.computer,
          Colors.orange,
        ),

        const SizedBox(height: 15),

        eventCard(
          context,
          "Coding Contest",
          "30 August 2026",
          Icons.laptop_mac,
          Colors.green,
        ),

        const SizedBox(height: 20),

      ],
    ),

    bottomNavigationBar: BottomNavigationBar(
      currentIndex: 0,
      selectedItemColor: Colors.deepPurple,
      onTap: (index) {
        if (index == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => EventDetailsScreen(
                title: "Hackathon 2026",
                date: "15 August 2026",
              ),
            ),
          );
        } else if (index == 2) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const ProfileScreen(),
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
  Color color,
) {
  return Card(
    elevation: 8,
    margin: const EdgeInsets.only(bottom: 10),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    child: InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => EventDetailsScreen(
              title: title,
              date: date,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Row(
          children: [
            Container(
              height: 65,
              width: 65,
              decoration: BoxDecoration(
                color: color.withOpacity(0.12),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Icon(
                icon,
                color: color,
                size: 34,
              ),
            ),

            const SizedBox(width: 16),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Row(
                    children: [
                      const Icon(
                        Icons.calendar_today,
                        size: 15,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        date,
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),

                  Row(
                    children: const [
                      Icon(
                        Icons.location_on,
                        size: 15,
                        color: Colors.red,
                      ),
                      SizedBox(width: 6),
                      Text(
                        "PCCOE, Pune",
                        style: TextStyle(
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.green.shade100,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      "Registration Open",
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: color,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => EventDetailsScreen(
                      title: title,
                      date: date,
                    ),
                  ),
                );
              },
              child: const Text("Register"),
            ),
          ],
        ),
      ),
    ),
  );
}
}