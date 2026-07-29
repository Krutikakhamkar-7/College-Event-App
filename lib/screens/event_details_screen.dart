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
      backgroundColor: const Color(0xffF6F5FB),

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        title: Text(title),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [

            // Hero Banner
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(25),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xff5B2EFF),
                    Color(0xffA100FF),
                  ],
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const Icon(
                    Icons.emoji_events,
                    color: Colors.amber,
                    size: 55,
                  ),

                  const SizedBox(height: 15),

                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      "Registration Open",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [

                  Row(
                    children: [

                      Expanded(
                        child: infoCard(
                          Icons.calendar_today,
                          "Date",
                          date,
                        ),
                      ),

                      const SizedBox(width: 12),

                      Expanded(
                        child: infoCard(
                          Icons.access_time,
                          "Time",
                          "10 AM - 5 PM",
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 15),

                  Row(
                    children: [

                      Expanded(
                        child: infoCard(
                          Icons.location_on,
                          "Venue",
                          "PCCOE Pune",
                        ),
                      ),

                      const SizedBox(width: 12),

                      Expanded(
                        child: infoCard(
                          Icons.people,
                          "Team",
                          "2-4 Members",
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(18),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Text(
                            "About Event",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          SizedBox(height: 12),

                          Text(
                            "This event is specially designed for engineering students who are passionate about coding, Artificial Intelligence, innovation and technology. Participants will collaborate in teams, solve real-world problems and compete for exciting prizes, internship opportunities and certificates.",
                            style: TextStyle(
                              fontSize: 16,
                              height: 1.6,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(18),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Text(
                            "Highlights",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          SizedBox(height: 15),

                          Row(
                            children: [
                              Icon(Icons.check_circle,
                                  color: Colors.green),
                              SizedBox(width: 10),
                              Text("Participation Certificate"),
                            ],
                          ),

                          SizedBox(height: 10),

                          Row(
                            children: [
                              Icon(Icons.check_circle,
                                  color: Colors.green),
                              SizedBox(width: 10),
                              Text("Cash Prize ₹50,000"),
                            ],
                          ),

                          SizedBox(height: 10),

                          Row(
                            children: [
                              Icon(Icons.check_circle,
                                  color: Colors.green),
                              SizedBox(width: 10),
                              Text("Internship Opportunities"),
                            ],
                          ),

                          SizedBox(height: 10),

                          Row(
                            children: [
                              Icon(Icons.check_circle,
                                  color: Colors.green),
                              SizedBox(width: 10),
                              Text("Networking with Experts"),
                            ],
                          ),

                          SizedBox(height: 10),

                          Row(
                            children: [
                              Icon(Icons.check_circle,
                                  color: Colors.green),
                              SizedBox(width: 10),
                              Text("Free Refreshments"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),

                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(15),
                        ),
                      ),
                      icon: const Icon(Icons.app_registration),
                      label: const Text(
                        "Register Now",
                        style: TextStyle(fontSize: 18),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                const RegistrationScreen(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget infoCard(
    IconData icon,
    String title,
    String value,
  ) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            Icon(
              icon,
              color: Colors.deepPurple,
              size: 32,
            ),

            const SizedBox(height: 10),

            Text(
              title,
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 6),

            Text(
              value,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}