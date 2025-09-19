import 'package:flutter/material.dart';

class EcoTravelScreen extends StatelessWidget {
  const EcoTravelScreen({super.key});

  final List<Map<String, String>> ecoOptions = const [
    {
      "title": "Eco-friendly activities",
      "detail": "Travelers who care about the environment. Here are some ideas:\n• Canoe or Kayak on Vellayani Lake ...",
      "image": "assets/image1.png"
    },
    {
      "title": "Eco-friendly travel routes",
      "detail": "Buses\nKerala State Road Transport Corporation (KSRTC) buses connect almost every town and ...",
      "image": "assets/image2.png"
    },
    {
      "title": "Eco-friendly food options",
      "detail": "Try local vegetarian restaurants and organic cafes for a sustainable food experience.",
      "image": "assets/image3.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text(
          "Eco-Travel",
          style: TextStyle(color: Colors.teal, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: ecoOptions.length,
          itemBuilder: (context, index) {
            final item = ecoOptions[index];
            return Card(
              margin: const EdgeInsets.only(bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(item["image"]!, fit: BoxFit.cover),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item["title"]!,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 6),
                        Text(item["detail"]!,
                            style: const TextStyle(color: Colors.black87)),
                        const SizedBox(height: 6),
                        const Text("Read more",
                            style: TextStyle(color: Colors.teal)),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
