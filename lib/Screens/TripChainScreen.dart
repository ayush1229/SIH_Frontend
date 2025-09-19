import 'package:flutter/material.dart';

class TripChainScreen extends StatelessWidget {
  const TripChainScreen({super.key});

  final List<Map<String, String>> tripSteps = const [
    {
      "title": "Delhi – Indira Gandhi International Airport (DEL)",
      "time": "7:30 AM – 10:00 AM",
      "detail": "Check-in & boarding flight"
    },
    {
      "title": "Trivandrum International Airport",
      "time": "1:30 PM – 2:00 PM",
      "detail": "Arrival, luggage"
    },
    {
      "title": "Taxi / Auto TRV → Kazhakkoottam",
      "time": "2:00 PM – 2:30 PM",
      "detail": "Road transfer (~15 km)"
    },
    {
      "title": "Kazhakkoottam",
      "time": "2:30 PM – 3:00 PM",
      "detail": "Quick lunch"
    },
    {
      "title": "Train Kazhakkoottam → Chirayinkeezhu Railway Station",
      "time": "2:30 PM – 3:00 PM",
      "detail": "Local train (~15 min)"
    },
    {
      "title": "Chirayinkeezhu, Thiruvananthapuram",
      "time": "3:25 PM onwards",
      "detail": "Final destination"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text(
          "Trip Chain",
          style: TextStyle(color: Colors.teal, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListView.builder(
                    itemCount: tripSteps.length,
                    itemBuilder: (context, index) {
                      final step = tripSteps[index];
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Timeline dot and line
                          Column(
                            children: [
                              const Icon(Icons.location_on,
                                  color: Colors.teal, size: 28),
                              if (index != tripSteps.length - 1)
                                Container(
                                  height: 50,
                                  width: 2,
                                  color: Colors.teal.withOpacity(0.5),
                                ),
                            ],
                          ),
                          const SizedBox(width: 12),
                          // Trip details
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(step["title"]!,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                                Text(step["time"]!,
                                    style: const TextStyle(
                                        fontSize: 14, color: Colors.black54)),
                                Text(step["detail"]!,
                                    style: const TextStyle(
                                        fontSize: 14, color: Colors.teal)),
                                const SizedBox(height: 16),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
            // Stop Tracking button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {},
              child: const Text(
                "Stop Tracking",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
