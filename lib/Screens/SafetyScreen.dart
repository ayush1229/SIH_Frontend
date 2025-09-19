import 'package:flutter/material.dart';

class SafetyScreen extends StatelessWidget {
  const SafetyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text(
          "Safety",
          style: TextStyle(color: Colors.teal, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              "Emergency Contacts",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal),
            ),
            const SizedBox(height: 12),

            // Police
            _buildContactCard(Icons.shield, "Police", "100"),
            const SizedBox(height: 12),

            // Fire Department
            _buildContactCard(Icons.local_fire_department, "Fire department", "101"),
            const SizedBox(height: 12),

            // Ambulance
            _buildContactCard(Icons.local_hospital, "Ambulance", "108"),
            const SizedBox(height: 24),

            const Text(
              "Nearest Hospitals",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal),
            ),
            const SizedBox(height: 12),

            Card(
              child: ListTile(
                leading: const Icon(Icons.local_hospital, color: Colors.teal),
                title: const Text("Attingal Multi specialty Hospital"),
                subtitle: const Text("2 km (~)"),
                trailing: const Icon(Icons.directions),
                onTap: () {
                  // TODO: Add map navigation
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactCard(IconData icon, String title, String number) {
    return Card(
      child: ListTile(
        leading: Icon(icon, color: Colors.teal, size: 30),
        title: Text(title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        subtitle: Text(number),
        trailing: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal,
              padding: const EdgeInsets.symmetric(horizontal: 16)),
          onPressed: () {
            // TODO: Add call function
          },
          child: const Text("Call", style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
