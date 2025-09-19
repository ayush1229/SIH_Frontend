import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsOptions = [
      "Activity & History",
      "Location & Language",
      "Bookmarks",
      "Account Settings",
      "Appearance",
      "Help",
      "Previous Reviews",
    ];

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: const Text("Settings", style: TextStyle(color: Colors.teal)),
      ),
      body: ListView.builder(
        itemCount: settingsOptions.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Card(
              margin: const EdgeInsets.all(16),
              child: ListTile(
                leading: const CircleAvatar(child: Icon(Icons.person)),
                title: const Text("John Doe"),
                subtitle: const Text("Add Profile"),
                trailing: const Icon(Icons.qr_code),
              ),
            );
          }
          return ListTile(
            title: Text(settingsOptions[index - 1]),
            trailing: const Icon(Icons.arrow_forward_ios),
          );
        },
      ),
    );
  }
}
