import 'package:flutter/material.dart';
import 'Screens/HomeScreen.dart';
import 'Screens/ExpensesScreen.dart';
import 'Screens/TripNotes.dart';
import 'Screens/UserProfileScreen.dart';
import 'Screens/TripChainScreen.dart';
import 'Screens/SafetyScreen.dart';
import 'Screens/EcoTravelScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SmartTrip',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      home: const HomeScreen(),
      routes: {
        '/expenses': (context) => const ExpensesScreen(),
        '/tripNotes': (context) => const TripNotesScreen(),
        '/settings': (context) => const SettingsScreen(),
        '/tripChain': (context) => const TripChainScreen(),
        '/safety': (context) => const SafetyScreen(),
        '/ecoTravel': (context) => const EcoTravelScreen(),
      },
    );
  }
}
