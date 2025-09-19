import 'package:flutter/material.dart';
import '../Screens/ExpneseDetailScreen.dart';

class ExpensesScreen extends StatelessWidget {
  const ExpensesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final locations = ["Chirayinkeezhu, Thiruvananthapuram", "Cheppara"];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Expenses", style: TextStyle(color: Colors.teal)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.teal),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: ListTile(
              title: Text(
                locations[index],
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ExpenseDetailScreen(
                      location: locations[index],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
