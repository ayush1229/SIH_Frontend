import 'package:flutter/material.dart';

class ExpenseDetailScreen extends StatelessWidget {
  final String location;
  const ExpenseDetailScreen({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
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
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Text(
              location,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            const SizedBox(height: 20),

            // Tickets
            buildExpenseItem("Tickets", "Golndigo", "₹ 15,000/-",
                "Delhi – Thiruvananthapuram +"),

            // Hotels
            buildExpenseItem("Hotels", "Chitrakut Inn-Goibigo", "₹ 3,000/-",
                "3 day 2 nights +"),

            // Taxi
            buildExpenseItem("Taxi fare", "Uber", "₹ 800/-",
                "Trivandrum airport-hotel +"),

            // Food
            buildExpenseItem("Food", "Shantanu restaurant", "₹ 1000/-",
                "Lunch, dinner for 3 days × 9 meals"),

            // Temple visits
            buildExpenseItem("Temple visits", "Sarkaradevi temple", "₹ 500/-", ""),
            buildExpenseItem("Temple visits", "Shree Durga Devi temple", "₹ 500/-", ""),

            const SizedBox(height: 20),
            const Text(
              "Edit Expenses",
              style: TextStyle(
                  color: Colors.teal,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline),
            ),

            const Divider(thickness: 1, height: 30),

            // Totals
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Grand Total:",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text("₹ 20,800/-",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.teal)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Budget:"),
                Text("₹ 30,000/-", style: TextStyle(color: Colors.teal)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Remaining:"),
                Text("₹ 9,200/-", style: TextStyle(color: Colors.teal)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildExpenseItem(
      String title, String name, String price, String subtitle) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name,
                        style: const TextStyle(
                            color: Colors.teal, fontWeight: FontWeight.w500)),
                    if (subtitle.isNotEmpty)
                      Text(subtitle,
                          style: const TextStyle(color: Colors.black54)),
                  ],
                ),
              ),
              Text(price,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, color: Colors.teal)),
            ],
          ),
        ],
      ),
    );
  }
}
