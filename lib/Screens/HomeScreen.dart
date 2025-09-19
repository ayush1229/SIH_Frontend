import 'package:flutter/material.dart';
import 'TripReportScreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Stack(
          children: [
            // App name at top center
            Positioned(
              top: 20,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  'SmartTrip',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal[700],
                    letterSpacing: 1.2,
                  ),
                ),
              ),
            ),
            // Profile in top right
            Positioned(
              top: 20,
              right: 20,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/settings');
                },
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.teal[300],
                  child: const Icon(
                    Icons.person,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            // Image in middle left
            Positioned(
              top: screenHeight * 0.15,
              left: screenWidth * 0.08,
              child: Image.asset(
                'assets/travel.png',
                width: screenWidth * 0.55,
              ),
            ),

            // Trip Info (Day + Started)
            Positioned(
              top: screenHeight * 0.18,
              right: screenWidth * 0.08,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.teal[100],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      "DAY 6",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Started:\n4-08-2025 (Thurs)",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),

            // Location
            Positioned(
              top: screenHeight * 0.38,
              left: screenWidth * 0.08,
              right: screenWidth * 0.08,
              child: Row(
                children: const [
                  Icon(Icons.location_on, color: Colors.teal),
                  SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      "Chirayinkeezhu, Thiruvananthapuram",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // "Tell us about the trip" button
            Positioned(
              top: screenHeight * 0.46,
              left: screenWidth * 0.08,
              right: screenWidth * 0.08,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal[700],
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const TripReportScreen()),
                  );
                },
                icon: const Icon(Icons.edit, color: Colors.white),
                label: const Text(
                  "TELL US ABOUT THE TRIP",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            // List of options (Maps, Expenses, etc.)
            Positioned(
              top: screenHeight * 0.56,
              left: screenWidth * 0.05,
              right: screenWidth * 0.05,
              bottom: 0,
              child: ListView(
                children: [
                  ListTile(
                    title: const Text("Maps"),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      // TODO: Add route for Maps if available
                    },
                  ),
                  const Divider(),
                  ListTile(
                    title: const Text("Expenses"),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      Navigator.pushNamed(context, '/expenses');
                    },
                  ),
                  const Divider(),
                  ListTile(
                    title: const Text("Trip Chain"),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      Navigator.pushNamed(context, '/tripChain');
                    },
                  ),
                  const Divider(),
                  ListTile(
                    title: const Text("Safety"),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      Navigator.pushNamed(context, '/safety');
                    },
                  ),
                  const Divider(),
                  ListTile(
                    title: const Text("Eco-travel"),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      Navigator.pushNamed(context, '/ecoTravel');
                    },
                  ),
                  const Divider(),
                  ListTile(
                    title: const Text("Trip Notes"),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      Navigator.pushNamed(context, '/tripNotes');
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
