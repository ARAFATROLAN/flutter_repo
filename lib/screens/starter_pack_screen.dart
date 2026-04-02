import 'package:flutter/material.dart';

class StarterPackScreen extends StatelessWidget {
  const StarterPackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> packs = [
      {
        "title": "Beginner Pack",
        "desc": "Start from basic concepts in all subjects"
      },
      {
        "title": "Exam Preparation",
        "desc": "Focus on past papers and revision"
      },
      {
        "title": "Weak in Math?",
        "desc": "Step-by-step math improvement"
      },
      {
        "title": "Reading Skills",
        "desc": "Improve English comprehension"
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Starter Packs"),
        backgroundColor: const Color(0xFF04AA6D),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: packs.length,
        itemBuilder: (context, index) {
          final item = packs[index];

          return Card(
            margin: const EdgeInsets.only(bottom: 15),
            child: ListTile(
              title: Text(
                item["title"]!,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(item["desc"]!),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {},
            ),
          );
        },
      ),
    );
  }
}