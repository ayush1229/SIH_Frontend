import 'package:flutter/material.dart';

class TripNotesScreen extends StatelessWidget {
  const TripNotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: const Text(
          "Trip Notes",
          style: TextStyle(color: Colors.teal),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/settings');
            },
            icon: const Icon(Icons.settings, color: Colors.teal),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Chirayinkeezhu, Thiruvananthapuram",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Divider(),
                  Text(
                      "Day 1: Stay at Chitrakut inn, Sunset at Perumathura Beach",style: TextStyle(color: Colors.teal),),
                  Text(
                      "Day 2: Morning walk at Anchuthengu Fort, Lunch at seafood shack",style: TextStyle(color: Colors.teal),),
                  SizedBox(height: 8),
                  Text("Read More", style: TextStyle(color: Colors.teal)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Cheppara",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Divider(),
                  Text("🚗 Route: Scenic drive through Thrissur’s winding roads",style: TextStyle(color: Colors.teal),),
                  Text("📍 Spot: Quiet hilltop with panoramic views",style: TextStyle(color: Colors.teal),),
                  Text("🥾 Activity: Short trek, great for photos",style: TextStyle(color: Colors.teal),),
                  Text("🌅 Highlight: Stunning sunrise & sunset",style: TextStyle(color: Colors.teal),),
                  SizedBox(height: 8),
                  Text("Read More", style: TextStyle(color: Colors.teal)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
